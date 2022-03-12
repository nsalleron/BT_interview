import 'dart:core';

import 'package:equatable/equatable.dart';

class TeamRequestParams extends Equatable {
  const TeamRequestParams({
    required this.teamId,
  });

  final int teamId;

  @override
  List<Object?> get props => [teamId];
}
