part of 'competition_cubit.dart';

@immutable
abstract class CompetitionState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CompetitionInitial extends CompetitionState {}

class CompetitionLoadInProgress extends CompetitionState {}

class CompetitionLoadSuccess extends CompetitionState {
  CompetitionLoadSuccess({
    required this.competitions,
  });

  final Competitions competitions;

  @override
  List<Object?> get props => [competitions];
}

class CompetitionLoadFailure extends CompetitionState {}
