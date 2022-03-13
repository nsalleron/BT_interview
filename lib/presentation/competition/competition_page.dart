import 'package:flutball/core/utils/dimens.dart';
import 'package:flutball/domain/entities/competition.dart';
import 'package:flutball/domain/entities/team.dart';
import 'package:flutball/presentation/competition/components/circular_loading.dart';
import 'package:flutball/presentation/competition/logic/competition_cubit.dart';
import 'package:flutball/presentation/competition/logic/team_cubit.dart';
import 'package:flutball/presentation/competition/views/club_team.dart';
import 'package:flutball/presentation/competition/views/competition_header.dart';
import 'package:flutball/presentation/competition/views/players.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CompetitionPage extends StatefulWidget {
  const CompetitionPage({Key? key}) : super(key: key);

  @override
  _CompetitionPageState createState() => _CompetitionPageState();
}

class _CompetitionPageState extends State<CompetitionPage> {
  int initialPage = 0;

  @override
  Widget build(BuildContext teamPageContext) => Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)?.app_title ?? ''),
        ),
        body: BlocConsumer<CompetitionCubit, CompetitionState>(
          listener: (BuildContext context, CompetitionState state) {
            if (state is CompetitionSuccess && state.competitions.isNotEmpty) {
              context.read<TeamCubit>().fetchBestTeam(competition: state.competitions.first);
            }
          },
          builder: (BuildContext context, CompetitionState competitionState) {
            if (competitionState is CompetitionFailure) {
              return const _FailedCompetitionState();
            }
            final List<Widget> competitions = _computeCompetition(competitionState);
            return PageView.builder(
              itemCount: competitions.length,
              onPageChanged: (page) => _fetchTeam(competitionState, page),
              itemBuilder: (BuildContext context, int index) {
                return competitions[index];
              },
            );
          },
        ),
      );

  void _fetchTeam(
    CompetitionState competitionState,
    int page,
  ) =>
      competitionState is CompetitionSuccess
          ? context.read<TeamCubit>().fetchBestTeam(
                competition: competitionState.competitions[page],
              )
          : null;

  List<Widget> _computeCompetition(CompetitionState competitionState) {
    return competitionState is CompetitionSuccess
        ? competitionState.competitions
            .map(
              (currentCompetition) => _CompetitionAndTeam(currentCompetition: currentCompetition),
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

class _CompetitionAndTeam extends StatelessWidget {
  const _CompetitionAndTeam({
    Key? key,
    required Competition currentCompetition,
  })  : _currentCompetition = currentCompetition,
        super(key: key);

  final Competition _currentCompetition;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            CompetitionHeader(comp: _currentCompetition),
            BlocBuilder<TeamCubit, TeamState>(
              builder: (buildContext, state) {
                if (state is TeamLoading) {
                  return const CircularLoading();
                }
                if (state is TeamSuccess) {
                  return _TeamSuccessPage(team: state.team);
                }
                if (state is TeamFailed) {
                  return _TeamPageFailed(
                    competition: _currentCompetition,
                    errorMessage: state.errorMessage,
                  );
                }
                if (state is TeamNoMatchesYet) {
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

class _TeamPageFailed extends StatelessWidget {
  const _TeamPageFailed({
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
            padding: const EdgeInsets.all(Dimens.largePadding),
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
              top: Dimens.largePadding,
              left: Dimens.largePadding,
              right: Dimens.largePadding,
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
        padding: const EdgeInsets.all(Dimens.largePadding),
        child: Text(
          AppLocalizations.of(context)?.team_noWinnerYet ?? '',
          style: const TextStyle(
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class _TeamSuccessPage extends StatelessWidget {
  const _TeamSuccessPage({
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
                const Padding(
                  padding: EdgeInsets.all(Dimens.largePadding),
                  child: Text(
                    'Current squad : ',
                    style: TextStyle(
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
          Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(Dimens.largePadding),
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
                    padding: const EdgeInsets.all(Dimens.largePadding),
                    child: SvgPicture.asset(
                      'assets/svg/nosquad.svg',
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                )
              ],
            ),
          )
      ],
    );
  }
}
