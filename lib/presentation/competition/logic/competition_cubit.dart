import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutball/core/params/competition_request_params.dart';
import 'package:flutball/core/resources/data_state.dart';
import 'package:flutball/domain/entities/competition.dart';
import 'package:flutball/domain/entities/helpers/types_helper.dart';
import 'package:flutball/domain/usecases/get_competitions_usecase.dart';
import 'package:meta/meta.dart';

part 'competition_state.dart';

class CompetitionCubit extends Cubit<CompetitionState> {
  CompetitionCubit({
    required GetCompetitionUseCase getCompetitionUseCase,
  })  : _getCompetitionUseCase = getCompetitionUseCase,
        super(CompetitionInitial());
  final GetCompetitionUseCase _getCompetitionUseCase;

  Future<void> fetchCompetitions({CompetitionsRequestParams? params}) async {
    emit(CompetitionLoading());
    final DataState<Competitions?> matchDataState = await _getCompetitionUseCase(
      params ?? const CompetitionsRequestParams(),
    );
    matchDataState.when(
      (p0) => emit(CompetitionSuccess(competitions: _sortCompetitionByEndDateAndRemoveSvgErrorCompetitions(p0!))),
      (p0) => emit(CompetitionFailure()),
    );
  }

  List<Competition> _sortCompetitionByEndDateAndRemoveSvgErrorCompetitions(Competitions competitions) {
    competitions.sort(
      (Competition a, Competition b) =>
          DateTime.parse(a.currentSeason.endDate).compareTo(DateTime.parse(a.currentSeason.endDate)),
    );

    return competitions.removeBrazilCauseSvgError();
  }
}

extension _RemoveBrazilFromCompetitionsExtension on Competitions {
  Competitions removeBrazilCauseSvgError() {
    return toList()..removeWhere((element) => element.id == 2013);
  }
}