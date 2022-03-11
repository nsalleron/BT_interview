import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutball/core/params/competition_request_params.dart';
import 'package:flutball/core/params/match_request_params.dart';
import 'package:flutball/core/params/team_request_params.dart';
import 'package:flutball/core/resources/data_state.dart';
import 'package:flutball/data/datasources/remote/football_api_service.dart';
import 'package:flutball/data/models/team_model.dart';
import 'package:flutball/data/repositories/football_repository.dart';
import 'package:flutball/domain/entities/helpers/types_helper.dart';

class FootballRepositoryImpl implements FootballRepository {
  FootballRepositoryImpl({
    required this.footballApiService,
    Options? footballRepositoryOptions,
  }) : footballRepositoryOptions = footballRepositoryOptions ?? buildCacheOptions(const Duration(minutes: 5));

  final FootballApiService footballApiService;
  Options footballRepositoryOptions;

  @override
  Future<DataState<Matches>> getMatches(MatchRequestParams params) async {
    try {
      return DataSuccess<Matches>([]);
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<TeamModel>> getTeams(TeamRequestParams params) async {
    try {
      return DataSuccess<TeamModel>(TeamModel());
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<Competitions?>> getCompetitions(CompetitionsRequestParams params) async {
    try {
      return DataSuccess<Competitions?>([]);
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }
}
