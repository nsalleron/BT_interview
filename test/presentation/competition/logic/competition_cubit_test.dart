import 'package:bloc_test/bloc_test.dart';
import 'package:dio/dio.dart';
import 'package:flutball/core/params/competition_request_params.dart';
import 'package:flutball/core/resources/data_state.dart';
import 'package:flutball/core/utils/constants.dart';
import 'package:flutball/domain/entities/helpers/types_helper.dart';
import 'package:flutball/domain/usecases/get_competitions_usecase.dart';
import 'package:flutball/presentation/competition/logic/competition_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../fixtures/competition_fixtures.dart';
import 'competition_cubit_test.mocks.dart';

@GenerateMocks([GetCompetitionUseCase])
void main() {
  final GetCompetitionUseCase mockGetCompetitionUseCase =
      MockGetCompetitionUseCase();
  CompetitionCubit retrieveNewCubit(
    GetCompetitionUseCase getCompetitionUseCase,
  ) =>
      CompetitionCubit(getCompetitionUseCase: getCompetitionUseCase);

  late CompetitionsRequestParams currentParams;

  group('$CompetitionCubit', () {
    test('Initial state is $CompetitionInitial', () {
      expect(
        retrieveNewCubit(mockGetCompetitionUseCase).state,
        isA<CompetitionInitial>(),
      );
    });

    blocTest<CompetitionCubit, CompetitionState>(
      '''emits [$CompetitionLoading, $CompetitionSuccess] when fetchCompetition is success''',
      setUp: () {
        currentParams = const CompetitionsRequestParams();
      },
      build: () {
        when(mockGetCompetitionUseCase(currentParams)).thenAnswer(
          (_) async => DataSuccess<Competitions?>([competitionFixture()]),
        );

        return retrieveNewCubit(mockGetCompetitionUseCase);
      },
      act: (cubit) => cubit.fetchCompetitions(params: currentParams),
      expect: () => [isA<CompetitionLoading>(), isA<CompetitionSuccess>()],
      verify: (cubit) {
        verify(mockGetCompetitionUseCase.call(currentParams)).called(1);
      },
    );

    blocTest<CompetitionCubit, CompetitionState>(
      '''emits [$CompetitionLoading, $CompetitionFailure] when fetchCompetition is failure''',
      setUp: () {
        currentParams = const CompetitionsRequestParams();
      },
      build: () {
        when(mockGetCompetitionUseCase(currentParams)).thenAnswer(
          (_) async => DataFailed(
            DioError(
              requestOptions: RequestOptions(path: kBaseUrl),
            ),
          ),
        );

        return retrieveNewCubit(mockGetCompetitionUseCase);
      },
      act: (cubit) => cubit.fetchCompetitions(params: currentParams),
      expect: () => [isA<CompetitionLoading>(), isA<CompetitionFailure>()],
      verify: (cubit) {
        verify(mockGetCompetitionUseCase.call(currentParams)).called(1);
      },
    );
  });
}
