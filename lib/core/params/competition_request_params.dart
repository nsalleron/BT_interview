import 'dart:core';

import 'package:equatable/equatable.dart';

class CompetitionsRequestParams extends Equatable {
  const CompetitionsRequestParams({
    this.plan = 'TIER_ONE',
  });
  final String plan;

  @override
  List<Object?> get props => [plan];
}
