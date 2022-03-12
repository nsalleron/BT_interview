import 'package:flutball/domain/entities/home_team.dart';
import 'package:json_annotation/json_annotation.dart';

part 'local_team_model.g.dart';

@JsonSerializable()
class LocalTeamModel extends LocalTeam {
  const LocalTeamModel({
    required int id,
    String? name,
  }) : super(id: id, name: name);

  factory LocalTeamModel.fromJson(Map<String, dynamic> json) => _$LocalTeamModelFromJson(json);

  Map<String, dynamic> toJson() => _$LocalTeamModelToJson(this);
}
