import 'package:flutball/domain/entities/stop_time.dart';

import 'package:json_annotation/json_annotation.dart';

part 'stop_time_model.g.dart';

@JsonSerializable()
class StopTimeModel extends StopTime {
  const StopTimeModel({
    int? homeTeam,
    int? awayTeam,
  }) : super(
          homeTeam: homeTeam,
          awayTeam: awayTeam,
        );

  factory StopTimeModel.fromJson(Map<String, dynamic> json) =>
      _$StopTimeModelFromJson(json);

  Map<String, dynamic> toJson() => _$StopTimeModelToJson(this);
}
