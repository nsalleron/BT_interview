import 'package:flutball/data/models/helpers/json_helpers.dart';
import 'package:flutball/data/models/local_team_model.dart';
import 'package:flutball/data/models/odds_model.dart';
import 'package:flutball/data/models/referees_model.dart';
import 'package:flutball/data/models/score_model.dart';
import 'package:flutball/data/models/season_model.dart';
import 'package:flutball/domain/entities/match.dart';
import 'package:json_annotation/json_annotation.dart';

part 'match_model.g.dart';

@JsonSerializable()
class MatchModel extends Match {
  const MatchModel({
    int? id,
    this.season,
    String? utcDate,
    String? status,
    int? matchday,
    String? stage,
    String? lastUpdated,
    this.odds,
    this.score,
    required this.homeTeam,
    required this.awayTeam,
    this.referees,
  }) : super(
          id: id,
          season: season,
          utcDate: utcDate,
          status: status,
          matchday: matchday,
          stage: stage,
          lastUpdated: lastUpdated,
          odds: odds,
          score: score,
          homeTeam: homeTeam,
          awayTeam: awayTeam,
          referees: referees,
        );

  factory MatchModel.fromJson(Map<String, dynamic> json) => _$MatchModelFromJson(json);

  @override
  @JsonKey(fromJson: seasonModelFromJson, toJson: seasonModelToJson)
  // ignore: overridden_fields
  final SeasonModel? season;
  @override
  @JsonKey(fromJson: oddsModelFromJson, toJson: oddsModelToJson)
  // ignore: overridden_fields
  final OddsModel? odds;
  @override
  @JsonKey(fromJson: scoreModelFromJson, toJson: scoreModelToJson)
  // ignore: overridden_fields
  final ScoreModel? score;
  @override
  @JsonKey(fromJson: localTeamFromJson, toJson: localTeamToJson)
  // ignore: overridden_fields
  final LocalTeamModel homeTeam;
  @override
  @JsonKey(fromJson: localTeamFromJson, toJson: localTeamToJson)
  // ignore: overridden_fields
  final LocalTeamModel awayTeam;

  @override
  @JsonKey(fromJson: refereesModelFromJson, toJson: refereesModelToJson)
  // ignore: overridden_fields
  final List<RefereesModel>? referees;

  Map<String, dynamic> toJson() => _$MatchModelToJson(this);
}
