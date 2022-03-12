import 'package:flutball/domain/entities/season.dart';
import 'package:json_annotation/json_annotation.dart';

part 'season_model.g.dart';

@JsonSerializable()
class SeasonModel extends Season {
  const SeasonModel({
    required int id,
    required String startDate,
    required String endDate,
    int? currentMatchday,
  }) : super(
          id: id,
          startDate: startDate,
          endDate: endDate,
          currentMatchday: currentMatchday,
        );

  factory SeasonModel.fromJson(Map<String, dynamic> json) =>
      _$SeasonModelFromJson(json);

  Map<String, dynamic> toJson() => _$SeasonModelToJson(this);
}
