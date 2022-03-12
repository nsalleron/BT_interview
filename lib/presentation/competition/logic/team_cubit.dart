import 'package:bloc/bloc.dart';
import 'package:dartx/dartx.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutball/core/params/match_request_params.dart';
import 'package:flutball/core/params/team_request_params.dart';
import 'package:flutball/core/resources/data_state.dart';
import 'package:flutball/domain/entities/competition.dart';
import 'package:flutball/domain/entities/current_season.dart';
import 'package:flutball/domain/entities/helpers/types_helper.dart';
import 'package:flutball/domain/entities/match.dart';
import 'package:flutball/domain/entities/team.dart';
import 'package:flutball/domain/usecases/get_match_usecase.dart';
import 'package:flutball/domain/usecases/get_team_usecase.dart';
import 'package:intl/intl.dart';

part 'team_state.dart';

class TeamCubit extends Cubit<TeamState> {
  TeamCubit({
    required this.getTeamUseCase,
    required this.getMatchesUseCase,
  }) : super(TeamInitial());

  GetTeamUseCase getTeamUseCase;
  GetMatchesUseCase getMatchesUseCase;
  final DateTime _now = DateTime.now();
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  late bool isCompetitionFinished;

  Future<void> fetchBestTeam({required Competition competition}) async {
    emit(TeamLoading());
    isCompetitionFinished = _isCompetitionFinished(competition.currentSeason);
    final DataState<Matches> matchDataState = await _retrieveMatchesFromCompetition(competition);
    matchDataState.when(_onMatchesFetched, _onMatchesFailed);
  }

  Future<void> _onMatchesFetched(Matches? matches) async {
    if (matches == null || matches.isEmpty) {
      return _noWinnerYet();
    }
    final int teamId = _retrieveBestTeamFromMatches(matches);

    final DataState<Team> teamDataState = await getTeamUseCase(TeamRequestParams(teamId: teamId));
    teamDataState.when(_onTeamFetched, _onTeamFailed);
  }

  int? _getWinner(Match e) => e.score?.winner! == 'HOME_TEAM' ? e.homeTeam.id : e.awayTeam.id;

  int _retrieveBestTeamFromMatches(Matches matches) {
    final Matches filteredMatches = isCompetitionFinished ? matches.findLastMatchDateAndMinusThirtyDays() : matches;

    final Map<int, int> idToWin = {};
    filteredMatches.map(_getWinner).whereNotNull().forEach(
          (x) => idToWin[x] = !idToWin.containsKey(x) ? (1) : (idToWin[x]! + 1),
        );
    return idToWin
        .toList()
        .reduce(
          (value, element) => value.second >= element.second ? value : element,
        )
        .first;
  }

  void _onMatchesFailed(DioError error) => {
        emit(
          // ignore: avoid_dynamic_calls
          TeamFailed(errorMessage: error.response?.data['message'] as String),
        )
      };

  void _onTeamFetched(Team? successTeam) =>
      successTeam != null ? emit(TeamSuccess(team: successTeam)) : emit(const TeamFailed(errorMessage: 'Team is null'));

  void _onTeamFailed(DioError error) => emit(TeamFailed(errorMessage: error.message));

  Future<DataState<Matches>> _retrieveMatchesFromCompetition(
    Competition competition,
  ) =>
      getMatchesUseCase(
        isCompetitionFinished
            ? MatchRequestParams(competitionId: competition.id)
            : MatchRequestParams(
                competitionId: competition.id,
                dateFrom: _thirtyDaysBeforeNow(),
                dateTo: _dateNow(),
              ),
      );

  bool _isCompetitionFinished(CurrentSeason currentSeason) => DateTime.parse(currentSeason.endDate).isBefore(_now);

  String _thirtyDaysBeforeNow() => formatter.format(_now.subtract(const Duration(days: 30)));

  String _dateNow() => formatter.format(_now);

  void _noWinnerYet() => emit(TeamNoMatchesYet());
}

extension ExtensionMatches on Matches {
  Matches findLastMatchDateAndMinusThirtyDays() {
    final Match lastMatch = filter((element) => element.utcDate != null).toList().cast<Match>().reduce(
          (value, element) =>
              DateTime.parse(value.utcDate!).isAfter(DateTime.parse(element.utcDate!)) ? value : element,
        );
    final DateTime beginningOfSortingByDate = DateTime.parse(lastMatch.utcDate!).subtract(const Duration(days: 30));

    final Matches filteredMatches = filter((element) => DateTime.parse(element.utcDate!).isAfter(beginningOfSortingByDate))
        .toList()
        .cast<Match>();
    return filteredMatches;
  }
}
