import 'package:bloc/bloc.dart';
import 'package:flutball/core/params/competition_request_params.dart';
import 'package:flutball/core/resources/data_state.dart';
import 'package:flutball/domain/entities/helpers/types_helper.dart';
import 'package:flutball/domain/usecases/get_competitions_usecase.dart';
import 'package:meta/meta.dart';

part 'competition_state.dart';

class CompetitionCubit extends Cubit<CompetitionState> {
  GetCompetitionUseCase _getCompetitionUseCase;

  CompetitionCubit({
    required GetCompetitionUseCase getCompetitionUseCase,
  })  : _getCompetitionUseCase = getCompetitionUseCase,
        super(CompetitionInitial());

  Future<void> fetchCompetitions({CompetitionsRequestParams? params}) async {
    emit(CompetitionLoading());
    DataState<Competitions?> matchDataState = await _getCompetitionUseCase(params ?? CompetitionsRequestParams());
    matchDataState.when((p0) => emit(CompetitionSuccess(competitions: p0!)), (p0) => emit(CompetitionFailure()));
  }
}
