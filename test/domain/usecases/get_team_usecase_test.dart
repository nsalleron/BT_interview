import 'package:flutball/core/params/team_request_params.dart';
import 'package:flutball/core/resources/data_state.dart';
import 'package:flutball/data/repositories/football_repository.dart';
import 'package:flutball/domain/entities/team.dart';
import 'package:flutball/domain/usecases/get_team_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../fixtures/team_fixtures.dart';
import 'get_team_usecase_test.mocks.dart';

@GenerateMocks([FootballRepository])
void main() {
  final FootballRepository footballRepository = MockFootballRepository();
  late GetTeamUseCase getTeamUseCase;

  setUp(() {
    getTeamUseCase = GetTeamUseCase(footballRepository);
  });

  group('FootballRepository', () {
    test('''
    GIVEN teamRequestParams and data
    WHEN getTeamUseCase 
    THEN data are equals and repository is called once
    ''', () async {
      //Given
      const TeamRequestParams teamRequestParams = TeamRequestParams(teamId: 0);
      final data = teamFixture();
      when(footballRepository.getTeams(teamRequestParams))
          .thenAnswer((_) async => DataSuccess<Team>(data));

      //When
      final result = await getTeamUseCase(teamRequestParams);

      //Then
      expect(result.data, data);
      verify(footballRepository.getTeams(teamRequestParams)).called(1);
    });
  });
}
