import 'package:flutball/data/models/area_model.dart';
import 'package:flutball/data/models/current_season_model.dart';
import 'package:flutball/data/models/helpers/json_helpers.dart';
import 'package:flutball/domain/entities/competition.dart';
import 'package:json_annotation/json_annotation.dart';

part 'competition_model.g.dart';

@JsonSerializable()
class CompetitionModel extends Competition {

  @override
  @JsonKey(fromJson: areaFromJson, toJson: areaToJson)
  final AreaModel? area;

  @override
  @JsonKey(fromJson: currentSeasonFromJson, toJson: currentSeasonToJson)
  final CurrentSeasonModel currentSeason;

  CompetitionModel({
    required int id,
    this.area,
    required String name,
    String? code,
    String? emblemUrl,
    required String plan,
    required this.currentSeason,
    required int numberOfAvailableSeasons,
    required String lastUpdated,
  }) : super(
            id: id,
            area: area,
            name: name,
            code: code,
            emblemUrl: emblemUrl,
            plan: plan,
            currentSeason: currentSeason,
            numberOfAvailableSeasons: numberOfAvailableSeasons,
            lastUpdated: lastUpdated);

  factory CompetitionModel.fromJson(Map<String, dynamic> json) => _$CompetitionModelFromJson(json);

  Map<String, dynamic> toJson() => _$CompetitionModelToJson(this);

}


