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
  final GetTeamUseCase mockGetTeamUseCase = MockGetTeamUseCase();
  final GetMatchesUseCase mockGetMatchesUseCase = MockGetMatchesUseCase();

  TeamCubit retrieveNewCubit(
      GetMatchesUseCase getMatchesUseCase,
      GetTeamUseCase getTeamUseCase,
      ) =>
      TeamCubit(
        getMatchesUseCase: mockGetMatchesUseCase,
        getTeamUseCase: mockGetTeamUseCase,
      );

  late MatchRequestParams matchRequestParams;
  late TeamRequestParams teamRequestParams;

  group('$TeamCubit', () {
    test('Initial state is $TeamInitial', () {
      expect(
        retrieveNewCubit(mockGetMatchesUseCase, mockGetTeamUseCase).state,
        isA<TeamInitial>(),
      );
    });

    blocTest<TeamCubit, TeamState>(
      'emits [$TeamLoading, $TeamSuccess] when fetchCompetition is success',
      setUp: () {
        matchRequestParams = MatchRequestParams(
          competitionId: 1,
          dateFrom: null,
          dateTo: null,
          status: 'FINISHED',
        );
        teamRequestParams = TeamRequestParams(teamId: 1);
      },
      build: () {
        when(mockGetMatchesUseCase(matchRequestParams))
            .thenAnswer((_) async => DataSuccess<Matches>([matchFixture()]));

        when(mockGetTeamUseCase(teamRequestParams))
            .thenAnswer((_) async => DataSuccess<Team>(teamFixture()));

        return retrieveNewCubit(mockGetMatchesUseCase, mockGetTeamUseCase);
      },
      act: (cubit) => cubit.fetchBestTeam(competition: competitionFixture()),
      expect: () => [isA<TeamLoading>(), isA<TeamSuccess>()],
      verify: (cubit) {
        verify(mockGetMatchesUseCase.call(matchRequestParams)).called(1);
      },
    );

    blocTest<TeamCubit, TeamState>(
      'emits [$TeamLoading, $TeamFailed] when fetchCompetition is success',
      setUp: () {
        matchRequestParams = MatchRequestParams(
          competitionId: 1,
          dateFrom: null,
          dateTo: null,
          status: 'FINISHED',
        );
        teamRequestParams = TeamRequestParams(teamId: 1);
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
      expect: () => [isA<TeamLoading>(), isA<TeamFailed>()],
      verify: (cubit) {
        verify(mockGetMatchesUseCase.call(matchRequestParams)).called(1);
      },
    );
  });
}
