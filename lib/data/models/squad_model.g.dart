// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'squad_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SquadModel _$SquadModelFromJson(Map<String, dynamic> json) {
  return SquadModel(
    id: json['id'] as int?,
    name: json['name'] as String?,
    position: json['position'] as String?,
    dateOfBirth: json['dateOfBirth'] as String?,
    countryOfBirth: json['countryOfBirth'] as String?,
    nationality: json['nationality'] as String?,
    shirtNumber: json['shirtNumber'] as int?,
    role: json['role'] as String?,
  );
}

Map<String, dynamic> _$SquadModelToJson(SquadModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'position': instance.position,
      'dateOfBirth': instance.dateOfBirth,
      'countryOfBirth': instance.countryOfBirth,
      'nationality': instance.nationality,
      'shirtNumber': instance.shirtNumber,
      'role': instance.role,
    };
