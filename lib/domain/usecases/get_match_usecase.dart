import 'package:flutball/core/params/match_request_params.dart';
import 'package:flutball/core/resources/data_state.dart';
import 'package:flutball/data/repositories/football_repository.dart';
import 'package:flutball/domain/entities/helpers/types_helper.dart';
import 'package:flutball/domain/entities/match.dart';
import 'package:flutball/domain/usecases/usecase.dart';

class GetMatchesUseCase
    implements UseCase<DataState<List<Match>>, MatchRequestParams> {
  GetMatchesUseCase(this._footballRepository);

  final FootballRepository _footballRepository;

  @override
  Future<DataState<Matches>> call(MatchRequestParams params) {
    return _footballRepository.getMatches(params);
  }
}
