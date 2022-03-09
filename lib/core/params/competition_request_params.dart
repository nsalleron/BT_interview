import 'dart:core';

import 'package:equatable/equatable.dart';

class CompetitionsRequestParams extends Equatable {
  final String plan;

  CompetitionsRequestParams({
    this.plan = 'TIER_ONE',
  });

  @override
  List<Object?> get props => [plan];
}
