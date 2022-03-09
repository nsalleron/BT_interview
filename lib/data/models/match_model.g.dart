// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MatchModel _$MatchModelFromJson(Map<String, dynamic> json) {
  return MatchModel(
    id: json['id'] as int?,
    season: seasonModelFromJson(json['season'] as Map<String, dynamic>?),
    utcDate: json['utcDate'] as String?,
    status: json['status'] as String?,
    matchday: json['matchday'] as int?,
    stage: json['stage'] as String?,
    lastUpdated: json['lastUpdated'] as String?,
    odds: oddsModelFromJson(json['odds'] as Map<String, dynamic>?),
    score: scoreModelFromJson(json['score'] as Map<String, dynamic>?),
    homeTeam: localTeamFromJson(json['homeTeam'] as Map<String, dynamic>),
    awayTeam: localTeamFromJson(json['awayTeam'] as Map<String, dynamic>),
    referees: refereesModelFromJson(json['referees'] as List?),
  );
}

Map<String, dynamic> _$MatchModelToJson(MatchModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'utcDate': instance.utcDate,
      'status': instance.status,
      'matchday': instance.matchday,
      'stage': instance.stage,
      'lastUpdated': instance.lastUpdated,
      'season': seasonModelToJson(instance.season),
      'odds': oddsModelToJson(instance.odds),
      'score': scoreModelToJson(instance.score),
      'homeTeam': localTeamToJson(instance.homeTeam),
      'awayTeam': localTeamToJson(instance.awayTeam),
      'referees': refereesModelToJson(instance.referees),
    };
