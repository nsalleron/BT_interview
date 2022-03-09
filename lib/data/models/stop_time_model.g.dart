// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stop_time_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StopTimeModel _$StopTimeModelFromJson(Map<String, dynamic> json) {
  return StopTimeModel(
    homeTeam: json['homeTeam'] as int?,
    awayTeam: json['awayTeam'] as int?,
  );
}

Map<String, dynamic> _$StopTimeModelToJson(StopTimeModel instance) =>
    <String, dynamic>{
      'homeTeam': instance.homeTeam,
      'awayTeam': instance.awayTeam,
    };
