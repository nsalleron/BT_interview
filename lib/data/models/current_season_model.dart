import 'package:flutball/data/models/helpers/json_helpers.dart';
import 'package:flutball/data/models/winner_model.dart';
import 'package:flutball/domain/entities/current_season.dart';
import 'package:json_annotation/json_annotation.dart';

part 'current_season_model.g.dart';

@JsonSerializable()
class CurrentSeasonModel extends CurrentSeason {

  @JsonKey(fromJson: winnerFromJson, toJson: winnerToJson)
  final WinnerModel? winnerModel;

  CurrentSeasonModel({
    required int id,
    required String startDate,
    required String endDate,
    int? currentMatchday,
    required this.winnerModel,
  }) : super(
          id: id,
          startDate: startDate,
          endDate: endDate,
          currentMatchday: currentMatchday,
          winner: winnerModel,
        );

  factory CurrentSeasonModel.fromJson(Map<String, dynamic> json) => _$CurrentSeasonModelFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentSeasonModelToJson(this);
}
