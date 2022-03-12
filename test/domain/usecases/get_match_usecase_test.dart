import 'package:flutball/core/params/match_request_params.dart';
import 'package:flutball/core/resources/data_state.dart';
import 'package:flutball/data/repositories/football_repository.dart';
import 'package:flutball/domain/entities/helpers/types_helper.dart';
import 'package:flutball/domain/entities/match.dart';
import 'package:flutball/domain/usecases/get_match_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../fixtures/match_fixtures.dart';
import 'get_competitions_usecase_test.mocks.dart';

@GenerateMocks([FootballRepository])
void main() {
  final FootballRepository footballRepository = MockFootballRepository();
  late GetMatchesUseCase getMatchUseCase;

  setUp(() {
    getMatchUseCase = GetMatchesUseCase(footballRepository);
  });

  group('FootballRepository', () {
    test('''
    GIVEN matchRequestParams and data
    WHEN getMatchUseCase 
    THEN data are equals and repository is called once
    ''', () async {
      //Given
      const MatchRequestParams matchRequestParams =
          MatchRequestParams(competitionId: 0);
      final data = <Match>[matchFixture()];
      when(footballRepository.getMatches(matchRequestParams))
          .thenAnswer((_) async => DataSuccess<Matches>(data));

      //When
      final result = await getMatchUseCase(matchRequestParams);

      //Then
      expect(result.data, data);
      verify(footballRepository.getMatches(matchRequestParams)).called(1);
    });
  });
}
