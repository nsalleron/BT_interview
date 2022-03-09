// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MatchResponseModel _$MatchResponseModelFromJson(Map<String, dynamic> json) {
  return MatchResponseModel(
    count: json['count'] as int,
    matches: matchesFromJson(json['matches'] as List),
  );
}

Map<String, dynamic> _$MatchResponseModelToJson(MatchResponseModel instance) =>
    <String, dynamic>{
      'count': instance.count,
      'matches': matchesToJson(instance.matches),
    };
