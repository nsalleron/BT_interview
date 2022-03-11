import 'package:flutball/core/params/competition_request_params.dart';
import 'package:flutball/core/params/match_request_params.dart';
import 'package:flutball/core/params/team_request_params.dart';
import 'package:flutball/core/resources/data_state.dart';
import 'package:flutball/domain/entities/helpers/types_helper.dart';
import 'package:flutball/domain/entities/team.dart';

abstract class FootballRepository {
  Future<DataState<Matches>> getMatches(MatchRequestParams params);

  Future<DataState<Team>> getTeams(TeamRequestParams params);

  Future<DataState<Competitions?>> getCompetitions(CompetitionsRequestParams params);

}
