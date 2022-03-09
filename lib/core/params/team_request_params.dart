import 'dart:core';

import 'package:equatable/equatable.dart';

class TeamRequestParams extends Equatable{
  final int teamId;

  TeamRequestParams({
    required this.teamId,
  });

  @override
  List<Object?> get props => [teamId];
}


