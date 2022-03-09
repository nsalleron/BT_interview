import 'package:flutball/data/models/helpers/json_helpers.dart';
import 'package:flutball/data/models/team_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'team_response_model.g.dart';

@JsonSerializable()
class TeamResponseModel {
  @JsonKey(toJson: teamModelToJson)
  final TeamModel team;

  TeamResponseModel({
    required this.team,
  });

  factory TeamResponseModel.fromJson(Map<String, dynamic> json) => TeamResponseModel(team: TeamModel.fromJson(json));

  Map<String, dynamic> toJson() => _$TeamResponseModelToJson(this);
}
