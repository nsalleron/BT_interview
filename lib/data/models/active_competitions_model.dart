import 'package:flutball/data/models/area_model.dart';
import 'package:flutball/data/models/helpers/json_helpers.dart';
import 'package:flutball/domain/entities/active_competitions.dart';
import 'package:json_annotation/json_annotation.dart';

part 'active_competitions_model.g.dart';

@JsonSerializable()
class ActiveCompetitionsModel extends ActiveCompetitions {

  @override
  @JsonKey(fromJson: areaFromJson, toJson: areaToJson)
  final AreaModel? area;

  const ActiveCompetitionsModel({
    int? id,
    this.area,
    String? name,
    String? code,
    String? plan,
    String? lastUpdated,
  }) : super(
    id: id,
    area: area,
    name: name,
    code: code,
    plan: plan,
    lastUpdated: lastUpdated,
  );


  factory ActiveCompetitionsModel.fromJson(Map<String, dynamic> json) => _$ActiveCompetitionsModelFromJson(json);

  Map<String, dynamic> toJson() => _$ActiveCompetitionsModelToJson(this);
}

