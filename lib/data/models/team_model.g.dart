// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TeamModel _$TeamModelFromJson(Map<String, dynamic> json) {
  return TeamModel(
    id: json['id'] as int,
    area: areaFromJson(json['area'] as Map<String, dynamic>?),
    activeCompetitions:
        activeCompetitionsFromJson(json['activeCompetitions'] as List?),
    name: json['name'] as String?,
    shortName: json['shortName'] as String?,
    tla: json['tla'] as String?,
    crestUrl: json['crestUrl'] as String?,
    address: json['address'] as String?,
    phone: json['phone'] as String?,
    website: json['website'] as String?,
    email: json['email'] as String?,
    founded: json['founded'] as int?,
    clubColors: json['clubColors'] as String?,
    venue: json['venue'] as String?,
    squad: squadFromJson(json['squad'] as List),
    lastUpdated: json['lastUpdated'] as String?,
  );
}

Map<String, dynamic> _$TeamModelToJson(TeamModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'shortName': instance.shortName,
      'tla': instance.tla,
      'crestUrl': instance.crestUrl,
      'address': instance.address,
      'phone': instance.phone,
      'website': instance.website,
      'email': instance.email,
      'founded': instance.founded,
      'clubColors': instance.clubColors,
      'venue': instance.venue,
      'lastUpdated': instance.lastUpdated,
      'squad': squadToJson(instance.squad),
      'area': areaToJson(instance.area),
      'activeCompetitions':
          activeCompetitionsToJson(instance.activeCompetitions),
    };
