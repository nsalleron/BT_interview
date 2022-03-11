import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutball/core/params/competition_request_params.dart';
import 'package:flutball/core/params/match_request_params.dart';
import 'package:flutball/core/params/team_request_params.dart';
import 'package:flutball/data/datasources/remote/football_api_service.dart';
import 'package:flutball/data/models/responses/competition_response_model.dart';
import 'package:flutball/data/models/responses/match_response_model.dart';
import 'package:flutball/data/models/responses/team_response_model.dart';
import 'package:flutball/data/repositories/football_repository.dart';
import 'package:flutball/data/repositories/football_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:retrofit/dio.dart';

import '../../fixtures/competition_response_fixtures.dart';
import '../../fixtures/match_response_fixtures.dart';
import '../../fixtures/team_response_fixtures.dart';
import 'football_repository_test.mocks.dart';

@GenerateMocks([FootballApiService, Options, RequestOptions])
void main() {
  late FootballApiService _footballApiService = MockFootballApiService();
  late Options _options = MockOptions();
  late RequestOptions _requestOptions = MockRequestOptions();
  late FootballRepository _footballRepository;

  setUp(() {
    _footballRepository = FootballRepositoryImpl(
      footballApiService: _footballApiService,
      footballRepositoryOptions: _options,
    );
  });

  group('FootballRepository', () {
    test('''
    GIVEN competitionResponseModel 
    WHEN getCompetitions 
    THEN repository should return only competitions
    ''', () async {
      //Given
      final _TIER_PLAN = "TIER_ONE";
      final CompetitionResponseModel competitionResponseModel = competitionResponseModelFixture();
      when(_footballApiService.getCompetitions(plan: _TIER_PLAN, options: _options)).thenAnswer(
        (_) async => HttpResponse<CompetitionResponseModel>(
          competitionResponseModel,
          Response<RequestOptions>(requestOptions: _requestOptions, statusCode: HttpStatus.ok),
        ),
      );

      //When
      final result = await _footballRepository.getCompetitions(CompetitionsRequestParams(plan: _TIER_PLAN));

      //Then
      expect(result.data, competitionResponseModel.competitions);
      verify(_footballApiService.getCompetitions(plan: _TIER_PLAN, options: _options)).called(1);
    });

    test('''
    GIVEN matchResponseModel 
    WHEN getMatches 
    THEN repository should return only competitions''', () async {
      //Given
      final MatchResponseModel matchResponseModel = matchResponseFixture();
      final String status = "FINISHED";
      when(_footballApiService.getMatches(
        competitionId: 0,
        status: status,
        dateFrom: anyNamed('dateFrom'),
        dateTo: anyNamed('dateTo'),
        options: _options,
      )).thenAnswer(
        (_) async => HttpResponse<MatchResponseModel>(
          matchResponseModel,
          Response<RequestOptions>(requestOptions: _requestOptions, statusCode: HttpStatus.ok),
        ),
      );

      //When
      final result = await _footballRepository.getMatches(MatchRequestParams(competitionId: 0, status: status));

      //Then
      expect(result.data, matchResponseModel.matches);
      verify(_footballApiService.getMatches(
        competitionId: 0,
        status: status,
        dateFrom: anyNamed('dateFrom'),
        dateTo: anyNamed('dateTo'),
        options: _options,
      )).called(1);
    });

    test('''
    GIVEN teamResponseModel 
    WHEN getTeam 
    THEN repository should return the team''', () async {
      //Given
      final TeamResponseModel teamResponseModel = teamResponseFixture();
      when(_footballApiService.getTeam(
        teamId: 0,
        options: _options,
      )).thenAnswer(
        (_) async => HttpResponse<TeamResponseModel>(
          teamResponseModel,
          Response<RequestOptions>(requestOptions: _requestOptions, statusCode: HttpStatus.ok),
        ),
      );

      //When
      final result = await _footballRepository.getTeams(TeamRequestParams(teamId: 0));

      //Then
      expect(result.data, teamResponseModel.team);
      verify(_footballApiService.getTeam(
        teamId: 0,
        options: _options,
      )).called(1);
    });
  });
}
