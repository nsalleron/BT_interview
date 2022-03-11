import 'package:flutball/core/params/competition_request_params.dart';
import 'package:flutball/core/resources/data_state.dart';
import 'package:flutball/data/repositories/football_repository.dart';
import 'package:flutball/domain/entities/helpers/types_helper.dart';
import 'package:flutball/domain/usecases/usecase.dart';
import 'package:dio/dio.dart';

class GetCompetitionUseCase implements UseCase<DataState<Competitions?>, CompetitionsRequestParams> {
  final FootballRepository _footballRepository;

  GetCompetitionUseCase(this._footballRepository);

  @override
  Future<DataState<Competitions?>> call(CompetitionsRequestParams params) {
    return Future.value(
      DataFailed<Competitions?>(
        DioError(
          requestOptions: RequestOptions(path: ''),
        ),
      ),
    );
  }
}
