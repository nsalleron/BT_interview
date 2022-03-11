import 'package:flutball/core/params/competition_request_params.dart';
import 'package:flutball/core/resources/data_state.dart';
import 'package:flutball/data/repositories/football_repository.dart';
import 'package:flutball/domain/entities/competition.dart';
import 'package:flutball/domain/entities/helpers/types_helper.dart';
import 'package:flutball/domain/usecases/get_competitions_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../fixtures/competition_fixtures.dart';
import 'get_competitions_usecase_test.mocks.dart';

@GenerateMocks([FootballRepository])
void main() {
  late FootballRepository _footballRepository = MockFootballRepository();
  late GetCompetitionUseCase _getCompetitionUseCase;

  setUp(() {
    _getCompetitionUseCase = GetCompetitionUseCase(_footballRepository);
  });

  group('FootballRepository', () {
    test('''
    GIVEN competitionsRequestParams and  data
    WHEN _getCompetitionUseCase 
    THEN data are equals and repository is called once
    ''', () async {
      //Given
      final CompetitionsRequestParams competitionsRequestParams = CompetitionsRequestParams();
      final data = <Competition>[competitionFixture()];
      when(_footballRepository.getCompetitions(competitionsRequestParams))
          .thenAnswer((_) async => DataSuccess<Competitions>(data));

      //When
      final result = await _getCompetitionUseCase(competitionsRequestParams);

      //Then
      expect(result.data, data);
      verify(_footballRepository.getCompetitions(competitionsRequestParams)).called(1);
    });
  });
}
