import 'package:flutball/core/params/team_request_params.dart';
import 'package:flutball/core/resources/data_state.dart';
import 'package:flutball/data/repositories/football_repository.dart';
import 'package:flutball/domain/entities/team.dart';
import 'package:flutball/domain/usecases/usecase.dart';

class GetTeamUseCase implements UseCase<DataState<Team>, TeamRequestParams> {
  GetTeamUseCase(this._footballRepository);

  final FootballRepository _footballRepository;

  @override
  Future<DataState<Team>> call(TeamRequestParams params) {
    return _footballRepository.getTeams(params);
  }
}
