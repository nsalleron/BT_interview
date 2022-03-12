part of 'competition_cubit.dart';

@immutable
abstract class CompetitionState {}

class CompetitionInitial extends CompetitionState {}

class CompetitionLoading extends CompetitionState {}

class CompetitionSuccess extends CompetitionState {
  CompetitionSuccess({
    required this.competitions,
  });

  final Competitions competitions;
}

class CompetitionFailure extends CompetitionState {}
