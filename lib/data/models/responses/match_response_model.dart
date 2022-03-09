import 'package:flutball/data/models/helpers/json_helpers.dart';
import 'package:flutball/data/models/helpers/types_helper.dart';
import 'package:json_annotation/json_annotation.dart';

part 'match_response_model.g.dart';

@JsonSerializable()
class MatchResponseModel {
  const MatchResponseModel({
    required this.count,
    required this.matches,
  });

  final int count;

  @JsonKey(fromJson: matchesFromJson, toJson: matchesToJson)
  final MatchesModel matches;

  factory MatchResponseModel.fromJson(Map<String, dynamic> json) => _$MatchResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$MatchResponseModelToJson(this);
}
