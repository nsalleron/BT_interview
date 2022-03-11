part of 'competition_cubit.dart';

@immutable
abstract class CompetitionState {}

class CompetitionInitial extends CompetitionState {}

class CompetitionLoading extends CompetitionState {}

class CompetitionSuccess extends CompetitionState {
  final Competitions competitions;

  CompetitionSuccess({
    required this.competitions,
  });
}

class CompetitionFailure extends CompetitionState {}
