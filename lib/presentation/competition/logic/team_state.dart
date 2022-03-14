part of 'team_cubit.dart';

abstract class TeamState extends Equatable {
  const TeamState();

  @override
  List<Object> get props => [];
}

class TeamInitial extends TeamState {}

class TeamLoadInProgress extends TeamState {}

class TeamLoadSuccess extends TeamState {
  const TeamLoadSuccess({
    required this.team,
  });

  final Team team;

  @override
  List<Object> get props => [team];
}

class TeamLoadFailed extends TeamState {
  const TeamLoadFailed({
    required this.errorMessage,
  });

  final String errorMessage;

  @override
  List<Object> get props => [errorMessage];
}

class TeamLoadFailedNoMatches extends TeamState {}
