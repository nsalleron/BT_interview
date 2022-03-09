// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'active_competitions_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActiveCompetitionsModel _$ActiveCompetitionsModelFromJson(
    Map<String, dynamic> json) {
  return ActiveCompetitionsModel(
    id: json['id'] as int?,
    area: areaFromJson(json['area'] as Map<String, dynamic>?),
    name: json['name'] as String?,
    code: json['code'] as String?,
    plan: json['plan'] as String?,
    lastUpdated: json['lastUpdated'] as String?,
  );
}

Map<String, dynamic> _$ActiveCompetitionsModelToJson(
        ActiveCompetitionsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'plan': instance.plan,
      'lastUpdated': instance.lastUpdated,
      'area': areaToJson(instance.area),
    };
