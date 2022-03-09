import 'package:equatable/equatable.dart';
import 'package:flutball/domain/entities/home_team.dart';
import 'package:flutball/domain/entities/odds.dart';
import 'package:flutball/domain/entities/referees.dart';
import 'package:flutball/domain/entities/score.dart';
import 'package:flutball/domain/entities/season.dart';

class Match extends Equatable {
  final int? id;
  final Season? season;
  final String? utcDate;
  final String? status;
  final int? matchday;
  final String? stage;
  final String? lastUpdated;
  final Odds? odds;
  final Score? score;
  final LocalTeam homeTeam;
  final LocalTeam awayTeam;
  final List<Referees>? referees;

  const Match({
    this.id,
    this.season,
    this.utcDate,
    this.status,
    this.matchday,
    this.stage,
    this.lastUpdated,
    this.odds,
    this.score,
    required this.homeTeam,
    required this.awayTeam,
    this.referees,
  });

  @override
  List<Object?> get props => [
        id,
        season,
        utcDate,
        status,
        matchday,
        stage,
        lastUpdated,
        odds,
        score,
        homeTeam,
        awayTeam,
        referees,
      ];

  @override
  bool? get stringify => true;
}
