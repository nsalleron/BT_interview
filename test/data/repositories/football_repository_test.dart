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
  final FootballApiService footballApiService = MockFootballApiService();
  final Options options = MockOptions();
  final RequestOptions requestOptions = MockRequestOptions();
  late FootballRepository footballRepository;

  setUp(() {
    footballRepository = FootballRepositoryImpl(
      footballApiService: footballApiService,
      footballRepositoryOptions: options,
    );
  });

  group('FootballRepository', () {
    test('''
    GIVEN competitionResponseModel 
    WHEN getCompetitions 
    THEN repository should return only competitions
    ''', () async {
      //Given
      const tierPlan = 'TIER_ONE';
      final CompetitionResponseModel competitionResponseModel =
          competitionResponseModelFixture();
      when(
        footballApiService.getCompetitions(
          plan: tierPlan,
          options: options,
        ),
      ).thenAnswer(
        (_) async => HttpResponse<CompetitionResponseModel>(
          competitionResponseModel,
          Response<RequestOptions>(
            requestOptions: requestOptions,
            statusCode: HttpStatus.ok,
          ),
        ),
      );

      //When
      final result = await footballRepository
          .getCompetitions(const CompetitionsRequestParams(plan: tierPlan));

      //Then
      expect(result.data, competitionResponseModel.competitions);
      verify(
        footballApiService.getCompetitions(
          plan: tierPlan,
          options: options,
        ),
      ).called(1);
    });

    test('''
    GIVEN matchResponseModel 
    WHEN getMatches 
    THEN repository should return only competitions''', () async {
      //Given
      final MatchResponseModel matchResponseModel = matchResponseFixture();
      const String status = 'FINISHED';
      when(
        footballApiService.getMatches(
          competitionId: 0,
          status: status,
          dateFrom: anyNamed('dateFrom'),
          dateTo: anyNamed('dateTo'),
          options: options,
        ),
      ).thenAnswer(
        (_) async => HttpResponse<MatchResponseModel>(
          matchResponseModel,
          Response<RequestOptions>(
            requestOptions: requestOptions,
            statusCode: HttpStatus.ok,
          ),
        ),
      );

      //When
      final result = await footballRepository.getMatches(
        const MatchRequestParams(competitionId: 0, status: status),
      );

      //Then
      expect(result.data, matchResponseModel.matches);
      verify(
        footballApiService.getMatches(
          competitionId: 0,
          status: status,
          dateFrom: anyNamed('dateFrom'),
          dateTo: anyNamed('dateTo'),
          options: options,
        ),
      ).called(1);
    });

    test('''
    GIVEN teamResponseModel 
    WHEN getTeam 
    THEN repository should return the team''', () async {
      //Given
      final TeamResponseModel teamResponseModel = teamResponseFixture();
      when(
        footballApiService.getTeam(
          teamId: 0,
          options: options,
        ),
      ).thenAnswer(
        (_) async => HttpResponse<TeamResponseModel>(
          teamResponseModel,
          Response<RequestOptions>(
            requestOptions: requestOptions,
            statusCode: HttpStatus.ok,
          ),
        ),
      );

      //When
      final result = await footballRepository.getTeams(
        const TeamRequestParams(teamId: 0),
      );

      //Then
      expect(result.data, teamResponseModel.team);
      verify(
        footballApiService.getTeam(
          teamId: 0,
          options: options,
        ),
      ).called(1);
    });
  });
}
