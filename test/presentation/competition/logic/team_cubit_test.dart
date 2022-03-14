import 'package:bloc_test/bloc_test.dart';
import 'package:dio/dio.dart';
import 'package:flutball/core/params/match_request_params.dart';
import 'package:flutball/core/params/team_request_params.dart';
import 'package:flutball/core/resources/data_state.dart';
import 'package:flutball/core/utils/constants.dart';
import 'package:flutball/domain/entities/helpers/types_helper.dart';
import 'package:flutball/domain/entities/team.dart';
import 'package:flutball/domain/usecases/get_match_usecase.dart';
import 'package:flutball/domain/usecases/get_team_usecase.dart';
import 'package:flutball/presentation/competition/logic/team_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../fixtures/competition_fixtures.dart';
import '../../../fixtures/match_fixtures.dart';
import '../../../fixtures/team_fixtures.dart';
import 'team_cubit_test.mocks.dart';

@GenerateMocks([GetTeamUseCase, GetMatchesUseCase])
void main() {
  late GetTeamUseCase mockGetTeamUseCase;
  late GetMatchesUseCase mockGetMatchesUseCase;

  TeamCubit retrieveNewCubit(
    GetMatchesUseCase getMatchesUseCase,
    GetTeamUseCase getTeamUseCase,
  ) =>
      TeamCubit(
        getMatchesUseCase: getMatchesUseCase,
        getTeamUseCase: getTeamUseCase,
      );

  late MatchRequestParams matchRequestParams;
  late TeamRequestParams teamRequestParams;

  group('$TeamCubit', () {
    test('Initial state is $TeamInitial', () {
      expect(
        retrieveNewCubit(MockGetMatchesUseCase(), MockGetTeamUseCase()).state,
        isA<TeamInitial>(),
      );
    });

    blocTest<TeamCubit, TeamState>(
      'emits [$TeamLoadInProgress, $TeamLoadSuccess] when fetchBestTeam is success',
      setUp: () {
        mockGetTeamUseCase = MockGetTeamUseCase();
        mockGetMatchesUseCase = MockGetMatchesUseCase();
        matchRequestParams = const MatchRequestParams(
          competitionId: 1,
          dateFrom: null,
          dateTo: null,
          status: 'FINISHED',
        );
        teamRequestParams = const TeamRequestParams(teamId: 1);
      },
      build: () {
        when(mockGetMatchesUseCase(matchRequestParams)).thenAnswer((_) async => DataSuccess<Matches>([matchFixture()]));

        when(mockGetTeamUseCase(teamRequestParams)).thenAnswer((_) async => DataSuccess<Team>(teamFixture()));

        return retrieveNewCubit(mockGetMatchesUseCase, mockGetTeamUseCase);
      },
      act: (cubit) => cubit.fetchBestTeam(competition: competitionFixture()),
      expect: () => [isA<TeamLoadInProgress>(), isA<TeamLoadSuccess>()],
      verify: (cubit) {
        verify(mockGetMatchesUseCase.call(matchRequestParams)).called(1);
      },
    );

    blocTest<TeamCubit, TeamState>(
      'emits [$TeamLoadInProgress,$TeamLoadFailed] when _retrieveMatchesFromCompetition is failure',
      setUp: () {
        mockGetTeamUseCase = MockGetTeamUseCase();
        mockGetMatchesUseCase = MockGetMatchesUseCase();
        matchRequestParams = const MatchRequestParams(
          competitionId: 1,
          dateFrom: null,
          dateTo: null,
          status: 'FINISHED',
        );
        teamRequestParams = const TeamRequestParams(teamId: 1);
      },
      build: () {
        when(mockGetMatchesUseCase(matchRequestParams)).thenAnswer(
          (_) async => DataFailed(
            DioError(
              response: Response<Map<String, String>>(
                requestOptions: RequestOptions(path: kBaseUrl),
                data: {'message': 'KO'},
              ),
              requestOptions: RequestOptions(path: kBaseUrl),
            ),
          ),
        );

        return retrieveNewCubit(mockGetMatchesUseCase, mockGetTeamUseCase);
      },
      act: (cubit) => cubit.fetchBestTeam(competition: competitionFixture()),
      expect: () => [isA<TeamLoadInProgress>(), isA<TeamLoadFailed>()],
      verify: (cubit) {
        verify(mockGetMatchesUseCase.call(matchRequestParams)).called(1);
      },
    );

    blocTest<TeamCubit, TeamState>(
      'emits [$TeamLoadInProgress, $TeamLoadFailed] when fetchBestTeam is failure',
      setUp: () {
        mockGetTeamUseCase = MockGetTeamUseCase();
        mockGetMatchesUseCase = MockGetMatchesUseCase();
        matchRequestParams = const MatchRequestParams(
          competitionId: 1,
          dateFrom: null,
          dateTo: null,
          status: 'FINISHED',
        );
        teamRequestParams = const TeamRequestParams(teamId: 1);
      },
      build: () {
        when(mockGetMatchesUseCase(matchRequestParams))
            .thenAnswer((_) async => DataSuccess<Matches>([matchFixture(withId: 1), matchFixture(withId: 2)]));

        when(mockGetTeamUseCase(teamRequestParams)).thenAnswer(
          (_) async => DataFailed(
            DioError(
              requestOptions: RequestOptions(path: kBaseUrl),
            ),
          ),
        );

        return retrieveNewCubit(mockGetMatchesUseCase, mockGetTeamUseCase);
      },
      act: (cubit) => cubit.fetchBestTeam(competition: competitionFixture()),
      expect: () => [isA<TeamLoadInProgress>(), isA<TeamLoadFailed>()],
      verify: (cubit) {
        verify(mockGetMatchesUseCase.call(matchRequestParams)).called(1);
      },
    );

    blocTest<TeamCubit, TeamState>(
      'emits [$TeamLoadInProgress, $TeamLoadFailedNoMatches] when fetchBestTeam is failure',
      setUp: () {
        mockGetTeamUseCase = MockGetTeamUseCase();
        mockGetMatchesUseCase = MockGetMatchesUseCase();
        matchRequestParams = const MatchRequestParams(
          competitionId: 1,
          dateFrom: null,
          dateTo: null,
          status: 'FINISHED',
        );
        teamRequestParams = const TeamRequestParams(teamId: 1);
      },
      build: () {
        when(mockGetMatchesUseCase(matchRequestParams))
            .thenAnswer((_) async => DataSuccess<Matches>([]));

        return retrieveNewCubit(mockGetMatchesUseCase, mockGetTeamUseCase);
      },
      act: (cubit) => cubit.fetchBestTeam(competition: competitionFixture()),
      expect: () => [isA<TeamLoadInProgress>(), isA<TeamLoadFailedNoMatches>()],
      verify: (cubit) {
        verify(mockGetMatchesUseCase.call(matchRequestParams)).called(1);
      },
    );

    blocTest<TeamCubit, TeamState>(
      'emits [$TeamLoadInProgress, $TeamLoadFailed] when fetchBestTeam is failure',
      setUp: () {
        mockGetTeamUseCase = MockGetTeamUseCase();
        mockGetMatchesUseCase = MockGetMatchesUseCase();
        matchRequestParams = const MatchRequestParams(
          competitionId: 1,
          dateFrom: null,
          dateTo: null,
          status: 'FINISHED',
        );
        teamRequestParams = const TeamRequestParams(teamId: 1);
      },
      build: () {
        when(mockGetMatchesUseCase(matchRequestParams))
            .thenAnswer((_) async => DataSuccess<Matches>([matchFixture()]));

        when(mockGetTeamUseCase(teamRequestParams)).thenAnswer(
          (_) async => DataFailed(
            DioError(
              requestOptions: RequestOptions(path: kBaseUrl),
            ),
          ),
        );

        return retrieveNewCubit(mockGetMatchesUseCase, mockGetTeamUseCase);
      },
      act: (cubit) => cubit.fetchBestTeam(competition: competitionFixture()),
      expect: () => [isA<TeamLoadInProgress>(), isA<TeamLoadFailed>()],
      verify: (cubit) {
        verify(mockGetMatchesUseCase.call(matchRequestParams)).called(1);
      },
    );

  });
}
