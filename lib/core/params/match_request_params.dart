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

//https://api.football-data.org/v2/competitions/2021/matches?dateFrom=2022-02-09&dateTo=2022-03-09&statis=FINISHED
