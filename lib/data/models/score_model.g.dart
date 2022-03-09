// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'score_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScoreModel _$ScoreModelFromJson(Map<String, dynamic> json) {
  return ScoreModel(
    winner: json['winner'] as String?,
    duration: json['duration'] as String?,
    fullTime: stopModelFromJson(json['fullTime'] as Map<String, dynamic>),
    halfTime: stopModelFromJson(json['halfTime'] as Map<String, dynamic>),
    extraTime: stopModelFromJson(json['extraTime'] as Map<String, dynamic>),
    penalties: stopModelFromJson(json['penalties'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ScoreModelToJson(ScoreModel instance) =>
    <String, dynamic>{
      'winner': instance.winner,
      'duration': instance.duration,
      'fullTime': stopModelToJson(instance.fullTime),
      'halfTime': stopModelToJson(instance.halfTime),
      'extraTime': stopModelToJson(instance.extraTime),
      'penalties': stopModelToJson(instance.penalties),
    };
