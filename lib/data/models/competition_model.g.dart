// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'competition_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompetitionModel _$CompetitionModelFromJson(Map<String, dynamic> json) {
  return CompetitionModel(
    id: json['id'] as int,
    area: areaFromJson(json['area'] as Map<String, dynamic>?),
    name: json['name'] as String,
    code: json['code'] as String?,
    emblemUrl: json['emblemUrl'] as String?,
    plan: json['plan'] as String,
    currentSeason:
        currentSeasonFromJson(json['currentSeason'] as Map<String, dynamic>),
    numberOfAvailableSeasons: json['numberOfAvailableSeasons'] as int,
    lastUpdated: json['lastUpdated'] as String,
  );
}

Map<String, dynamic> _$CompetitionModelToJson(CompetitionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'emblemUrl': instance.emblemUrl,
      'plan': instance.plan,
      'numberOfAvailableSeasons': instance.numberOfAvailableSeasons,
      'lastUpdated': instance.lastUpdated,
      'area': areaToJson(instance.area),
      'currentSeason': currentSeasonToJson(instance.currentSeason),
    };
