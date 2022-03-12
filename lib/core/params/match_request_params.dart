import 'dart:core';

import 'package:equatable/equatable.dart';

class MatchRequestParams extends Equatable {
  const MatchRequestParams({
    required this.competitionId,
    this.dateFrom,
    this.dateTo,
    this.status = 'FINISHED',
  });

  final int competitionId;
  final String? dateFrom;
  final String? dateTo;
  final String status;

  @override
  List<Object?> get props => [competitionId, dateTo, dateFrom, status];
}
