// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'referees_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RefereesModel _$RefereesModelFromJson(Map<String, dynamic> json) {
  return RefereesModel(
    id: json['id'] as int?,
    name: json['name'] as String?,
    role: json['role'] as String?,
    nationality: json['nationality'] as String?,
  );
}

Map<String, dynamic> _$RefereesModelToJson(RefereesModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'role': instance.role,
      'nationality': instance.nationality,
    };
