part of 'competition_cubit.dart';

@immutable
abstract class CompetitionState extends Equatable{}

class CompetitionInitial extends CompetitionState {
  @override
  List<Object?> get props => [];
}

class CompetitionLoading extends CompetitionState {
  @override
  List<Object?> get props => [];
}

class CompetitionSuccess extends CompetitionState {
  CompetitionSuccess({
    required this.competitions,
  });

  final Competitions competitions;

  @override
  List<Object?> get props => [competitions];
}

class CompetitionFailure extends CompetitionState {
  @override
  List<Object?> get props => [];
}
