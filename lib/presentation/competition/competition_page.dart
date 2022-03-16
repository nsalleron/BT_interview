import 'package:flutball/core/utils/dimens.dart';
import 'package:flutball/domain/entities/competition.dart';
import 'package:flutball/domain/entities/team.dart';
import 'package:flutball/injector.dart';
import 'package:flutball/presentation/competition/components/circular_loading.dart';
import 'package:flutball/presentation/competition/logic/competition_cubit.dart';
import 'package:flutball/presentation/competition/logic/team_cubit.dart';
import 'package:flutball/presentation/competition/views/club_team.dart';

import 'package:flutball/presentation/competition/views/competition_header.dart';
import 'package:flutball/presentation/competition/views/players.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:i18n/generated/l10n.dart';

import 'package:i18n/i18n.dart';

class CompetitionPage extends StatelessWidget {
  const CompetitionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(I18n.current.app_title),
        ),
        body: BlocBuilder<CompetitionCubit, CompetitionState>(
          builder: (BuildContext context, CompetitionState competitionState) {
            if (competitionState is CompetitionLoadFailure) {
              return const _FailedCompetitionState();
            }
            final List<Widget> competitions = _computeCompetition(competitionState);
            return PageView.builder(
              itemCount: competitions.length,
              itemBuilder: (BuildContext context, int index) => competitions[index],
            );
          },
        ),
      );

  List<Widget> _computeCompetition(CompetitionState competitionState) {
    return competitionState is CompetitionLoadSuccess
        ? competitionState.competitions
            .map(
              (Competition currentCompetition) => BlocProvider(
                create: (_) => TeamCubit(getTeamUseCase: appInjector(), getMatchesUseCase: appInjector()),
                child: _CompetitionAndTeam(currentCompetition: currentCompetition),
              ),
            )
            .toList(growable: false)
        : [];
  }
}

class _FailedCompetitionState extends StatelessWidget {
  const _FailedCompetitionState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => context.read<CompetitionCubit>().fetchCompetitions(),
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: SvgPicture.asset(
          'assets/svg/failed.svg',
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}

class _CompetitionAndTeam extends StatefulWidget {
  const _CompetitionAndTeam({
    Key? key,
    required Competition currentCompetition,
  })  : _currentCompetition = currentCompetition,
        super(key: key);

  final Competition _currentCompetition;

  @override
  State<_CompetitionAndTeam> createState() => _CompetitionAndTeamState();
}

class _CompetitionAndTeamState extends State<_CompetitionAndTeam> {
  @override
  void initState() {
    context.read<TeamCubit>().fetchBestTeam(competition: widget._currentCompetition);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: Dimens.halfPadding),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            CompetitionHeader(comp: widget._currentCompetition),
            BlocBuilder<TeamCubit, TeamState>(
              builder: (buildContext, state) {
                if (state is TeamLoadInProgress) {
                  return const CircularLoading();
                }
                if (state is TeamLoadSuccess) {
                  return _TeamSuccess(team: state.team);
                }
                if (state is TeamLoadFailed) {
                  return _TeamFailed(
                    competition: widget._currentCompetition,
                    errorMessage: state.errorMessage,
                  );
                }
                if (state is TeamLoadFailedNoMatches) {
                  return const _TeamNoMatchesYet();
                }
                return const SizedBox.shrink();
              },
            )
          ],
        ),
      ),
    );
  }
}

class _TeamSuccess extends StatelessWidget {
  const _TeamSuccess({
    Key? key,
    required Team team,
  })  : _team = team,
        super(key: key);

  final Team _team;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        ClubTeam(team: _team),
        if (_team.squad?.isNotEmpty == true)
          Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(Dimens.mediumPadding),
                  child: Text(
                    I18n.current.team_squad,
                    style: const TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Players(squad: _team.squad!)
              ],
            ),
          )
        else
          const _NoSelection()
      ],
    );
  }
}

class _TeamFailed extends StatelessWidget {
  const _TeamFailed({
    Key? key,
    required Competition competition,
    required String errorMessage,
  })  : _competition = competition,
        _errorMessage = errorMessage,
        super(key: key);

  final Competition _competition;
  final String _errorMessage;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsets.all(Dimens.mediumPadding),
            child: Text(
              _errorMessage,
              style: const TextStyle(
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: Dimens.mediumPadding,
              left: Dimens.mediumPadding,
              right: Dimens.mediumPadding,
            ),
            child: RefreshIndicator(
              onRefresh: () => context.read<TeamCubit>().fetchBestTeam(competition: _competition),
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: SvgPicture.asset(
                  'assets/svg/failed.svg',
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _TeamNoMatchesYet extends StatelessWidget {
  const _TeamNoMatchesYet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(Dimens.mediumPadding),
        child: Text(
          I18n.current.team_noWinnerYet,
          style: const TextStyle(
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class _NoSelection extends StatelessWidget {
  const _NoSelection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(Dimens.mediumPadding),
            child: Text(
              'No selection for now!',
              style: TextStyle(
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(Dimens.mediumPadding),
              child: SvgPicture.asset(
                'assets/svg/nosquad.svg',
                fit: BoxFit.fitHeight,
              ),
            ),
          )
        ],
      ),
    );
  }
}
