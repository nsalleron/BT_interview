import 'package:flutball/data/models/helpers/json_helpers.dart';
import 'package:flutball/data/models/helpers/types_helper.dart';

import 'package:json_annotation/json_annotation.dart';

part 'competition_response_model.g.dart';

@JsonSerializable()
class CompetitionResponseModel {
  const CompetitionResponseModel({
    required this.count,
    required this.competitions,
  });

  factory CompetitionResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CompetitionResponseModelFromJson(json);

  final int count;

  @JsonKey(fromJson: competitionsFromJson, toJson: competitionsToJson)
  final CompetitionsModel? competitions;

  Map<String, dynamic> toJson() => _$CompetitionResponseModelToJson(this);
}
