part of 'team_cubit.dart';

abstract class TeamState extends Equatable {
  const TeamState();
}

class TeamInitial extends TeamState {
  @override
  List<Object> get props => [];
}

class TeamLoading extends TeamState {
  @override
  List<Object> get props => [];
}

class TeamSuccess extends TeamState {
  final Team team;

  const TeamSuccess({
    required this.team,
  });

  @override
  List<Object> get props => [team];
}

class TeamFailed extends TeamState {
  final String errorMessage;

  const TeamFailed({
    required this.errorMessage,
  });

  @override
  List<Object> get props => [errorMessage];
}

class TeamNoMatchesYet extends TeamState {
  List<Object?> get props => [];
}
