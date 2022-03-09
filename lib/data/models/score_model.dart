import 'dart:core';

import 'package:flutball/data/models/helpers/json_helpers.dart';
import 'package:flutball/data/models/stop_time_model.dart';
import 'package:flutball/domain/entities/score.dart';
import 'package:json_annotation/json_annotation.dart';

part 'score_model.g.dart';

@JsonSerializable()
class ScoreModel extends Score {
  @override
  @JsonKey(fromJson: stopModelFromJson, toJson: stopModelToJson)
  final StopTimeModel? fullTime;
  @override
  @JsonKey(fromJson: stopModelFromJson, toJson: stopModelToJson)
  final StopTimeModel? halfTime;
  @override
  @JsonKey(fromJson: stopModelFromJson, toJson: stopModelToJson)
  final StopTimeModel? extraTime;
  @override
  @JsonKey(fromJson: stopModelFromJson, toJson: stopModelToJson)
  final StopTimeModel? penalties;

  ScoreModel({
    String? winner,
    String? duration,
    this.fullTime,
    this.halfTime,
    this.extraTime,
    this.penalties,
  }) : super(
          winner: winner,
          duration: duration,
          fullTime: fullTime,
          halfTime: halfTime,
          extraTime: extraTime,
          penalties: penalties,
        );

  factory ScoreModel.fromJson(Map<String, dynamic> json) => _$ScoreModelFromJson(json);

  Map<String, dynamic> toJson() => _$ScoreModelToJson(this);
}

