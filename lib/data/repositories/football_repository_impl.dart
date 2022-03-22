import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutball/core/params/competition_request_params.dart';
import 'package:flutball/core/params/match_request_params.dart';
import 'package:flutball/core/params/team_request_params.dart';
import 'package:flutball/core/resources/data_state.dart';
import 'package:flutball/data/datasources/remote/football_api_service.dart';
import 'package:flutball/data/models/responses/competition_response_model.dart';
import 'package:flutball/data/models/responses/match_response_model.dart';
import 'package:flutball/data/models/responses/team_response_model.dart';
import 'package:flutball/data/models/team_model.dart';
import 'package:flutball/data/repositories/extensions.dart';
import 'package:flutball/data/repositories/football_repository.dart';
import 'package:flutball/domain/entities/helpers/types_helper.dart';
import 'package:retrofit/retrofit.dart';

class FootballRepositoryImpl implements FootballRepository {
  FootballRepositoryImpl({
    required FootballApiService footballApiService,
    Options? footballRepositoryOptions,
  })  : _footballApiService = footballApiService,
        _footballRepositoryOptions = footballRepositoryOptions ?? buildCacheOptions(const Duration(minutes: 10));

  final FootballApiService _footballApiService;
  final Options _footballRepositoryOptions;

  @override
  Future<DataState<Matches>> getMatches(MatchRequestParams params) async {
    try {
      final HttpResponse<MatchResponseModel> response = await _footballApiService.getMatches(
        competitionId: params.competitionId,
        dateFrom: params.dateFrom,
        dateTo: params.dateTo,
        status: params.status,
        options: _footballRepositoryOptions,
      );

      return response.whenSuccessOrDefaultError<Matches>(
        (MatchResponseModel p0) => p0.matches,
      );
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<TeamModel>> getTeams(TeamRequestParams params) async {
    try {
      final HttpResponse<TeamResponseModel> response =
      await _footballApiService.getTeam(
        teamId: params.teamId,
        options: _footballRepositoryOptions,
      );
      return response.whenSuccessOrDefaultError<TeamModel>((p0) => p0.team);
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<Competitions?>> getCompetitions(
    CompetitionsRequestParams params,
  ) async {
    try {
      final HttpResponse<CompetitionResponseModel> response =
      await _footballApiService.getCompetitions(
        plan: params.plan,
        options: _footballRepositoryOptions,
      );
      return response
          .whenSuccessOrDefaultError<Competitions?>((p0) => p0.competitions);
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }
}
