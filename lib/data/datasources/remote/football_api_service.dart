import 'package:dio/dio.dart';
import 'package:flutball/core/utils/constants.dart';
import 'package:flutball/data/models/responses/competition_response_model.dart';
import 'package:flutball/data/models/responses/match_response_model.dart';
import 'package:flutball/data/models/responses/team_response_model.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';

part 'football_api_service.g.dart';

@RestApi(baseUrl: kBaseUrl)
abstract class FootballApiService {
  factory FootballApiService(Dio dio, {String baseUrl}) = _FootballApiService;

  @GET('/$kApiVersion/competitions/{id}/matches')
  Future<HttpResponse<MatchResponseModel>> getMatches({
    @Path("id") required int competitionId,
    @Query("dateFrom") String? dateFrom,
    @Query("dateTo") String? dateTo,
    @Query("status") required String status,
    @DioOptions() required Options options,
  });

  //https://api.football-data.org/v2/teams/18
  @GET('/$kApiVersion/teams/{id}')
  Future<HttpResponse<TeamResponseModel>> getTeam({
    @Path("id") required int teamId,
    @DioOptions() required Options options,
  });

  @GET('/$kApiVersion/competitions')
  Future<HttpResponse<CompetitionResponseModel>> getCompetitions({
    @Query("plan") required String plan,
    @DioOptions() required Options options,
  });
}
