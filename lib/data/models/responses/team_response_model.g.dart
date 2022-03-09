// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TeamResponseModel _$TeamResponseModelFromJson(Map<String, dynamic> json) {
  return TeamResponseModel(
    team: TeamModel.fromJson(json['team'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$TeamResponseModelToJson(TeamResponseModel instance) =>
    <String, dynamic>{
      'team': teamModelToJson(instance.team),
    };
