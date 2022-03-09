// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'competition_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompetitionResponseModel _$CompetitionResponseModelFromJson(
    Map<String, dynamic> json) {
  return CompetitionResponseModel(
    count: json['count'] as int,
    competitions: competitionsFromJson(json['competitions'] as List?),
  );
}

Map<String, dynamic> _$CompetitionResponseModelToJson(
        CompetitionResponseModel instance) =>
    <String, dynamic>{
      'count': instance.count,
      'competitions': competitionsToJson(instance.competitions),
    };
