import 'package:flutball/data/models/active_competitions_model.dart';
import 'package:flutball/data/models/area_model.dart';
import 'package:flutball/data/models/helpers/json_helpers.dart';
import 'package:flutball/data/models/squad_model.dart';
import 'package:flutball/domain/entities/team.dart';
import 'package:json_annotation/json_annotation.dart';

part 'team_model.g.dart';

@JsonSerializable()
class TeamModel extends Team {
  const TeamModel({
    int? id,
    this.area,
    this.activeCompetitions,
    String? name,
    String? shortName,
    String? tla,
    String? crestUrl,
    String? address,
    String? phone,
    String? website,
    String? email,
    int? founded,
    String? clubColors,
    String? venue,
    this.squad,
    String? lastUpdated,
  }) : super(
          id: id,
          area: area,
          activeCompetitions: activeCompetitions,
          name: name,
          shortName: shortName,
          tla: tla,
          crestUrl: crestUrl,
          address: address,
          phone: phone,
          website: website,
          email: email,
          founded: founded,
          clubColors: clubColors,
          venue: venue,
          squad: squad,
          lastUpdated: lastUpdated,
        );

  factory TeamModel.fromJson(Map<String, dynamic> json) => _$TeamModelFromJson(json);

  @override
  @JsonKey(fromJson: squadFromJson, toJson: squadToJson)
  // ignore: overridden_fields
  final List<SquadModel>? squad;
  @override
  @JsonKey(fromJson: areaFromJson, toJson: areaToJson)
  // ignore: overridden_fields
  final AreaModel? area;
  @override
  @JsonKey(
    fromJson: activeCompetitionsFromJson,
    toJson: activeCompetitionsToJson,
  )
  // ignore: overridden_fields
  final List<ActiveCompetitionsModel>? activeCompetitions;

  Map<String, dynamic> toJson() => _$TeamModelToJson(this);
}
