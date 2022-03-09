// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_season_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentSeasonModel _$CurrentSeasonModelFromJson(Map<String, dynamic> json) {
  return CurrentSeasonModel(
    id: json['id'] as int,
    startDate: json['startDate'] as String,
    endDate: json['endDate'] as String,
    currentMatchday: json['currentMatchday'] as int?,
    winnerModel: winnerFromJson(json['winnerModel'] as Map<String, dynamic>?),
  );
}

Map<String, dynamic> _$CurrentSeasonModelToJson(CurrentSeasonModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'currentMatchday': instance.currentMatchday,
      'winnerModel': winnerToJson(instance.winnerModel),
    };
