// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'winner_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WinnerModel _$WinnerModelFromJson(Map<String, dynamic> json) {
  return WinnerModel(
    id: json['id'] as int,
    name: json['name'] as String,
    shortName: json['shortName'] as String,
    crestUrl: json['crestUrl'] as String,
    tla: json['tla'] as String,
  );
}

Map<String, dynamic> _$WinnerModelToJson(WinnerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'shortName': instance.shortName,
      'tla': instance.tla,
      'crestUrl': instance.crestUrl,
    };
