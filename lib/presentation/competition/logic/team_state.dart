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
  const TeamSuccess({
    required this.team,
  });

  final Team team;

  @override
  List<Object> get props => [team];
}

class TeamFailed extends TeamState {

  const TeamFailed({
    required this.errorMessage,
  });

  final String errorMessage;

  @override
  List<Object> get props => [errorMessage];
}

class TeamNoMatchesYet extends TeamState {
  @override
  List<Object?> get props => [];
}
