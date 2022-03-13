import 'package:flutball/data/models/active_competitions_model.dart';
import 'package:flutball/data/models/area_model.dart';
import 'package:flutball/data/models/competition_model.dart';
import 'package:flutball/data/models/current_season_model.dart';
import 'package:flutball/data/models/helpers/types_helper.dart';
import 'package:flutball/data/models/local_team_model.dart';
import 'package:flutball/data/models/match_model.dart';
import 'package:flutball/data/models/odds_model.dart';
import 'package:flutball/data/models/referees_model.dart';
import 'package:flutball/data/models/score_model.dart';
import 'package:flutball/data/models/season_model.dart';
import 'package:flutball/data/models/squad_model.dart';
import 'package:flutball/data/models/stop_time_model.dart';
import 'package:flutball/data/models/team_model.dart';
import 'package:flutball/data/models/winner_model.dart';

Map<String, dynamic>? areaToJson(AreaModel? areaModel) => areaModel?.toJson();

AreaModel? areaFromJson(Map<String, dynamic>? json) => json != null ? AreaModel.fromJson(json) : null;

Map<String, dynamic> currentSeasonToJson(CurrentSeasonModel currentSeason) => currentSeason.toJson();

CurrentSeasonModel currentSeasonFromJson(Map<String, dynamic> json) => CurrentSeasonModel.fromJson(json);

Map<String, dynamic>? stopModelToJson(StopTimeModel? stopTimeModel) => stopTimeModel?.toJson();

StopTimeModel stopModelFromJson(Map<String, dynamic> json) => StopTimeModel.fromJson(json);

List<Map<String, dynamic>>? squadToJson(List<SquadModel>? squad) =>
    squad?.map((e) => e.toJson()).toList(growable: false);

List<SquadModel> squadFromJson(List<dynamic> json) =>
    json.map((dynamic e) => SquadModel.fromJson(e as Map<String, dynamic>)).toList(growable: false);

List<Map<String, dynamic>>? activeCompetitionsToJson(
  List<ActiveCompetitionsModel>? areaModel,
) =>
    areaModel?.map((e) => e.toJson()).toList(growable: false);

List<ActiveCompetitionsModel>? activeCompetitionsFromJson(
  List<dynamic>? json,
) =>
    json
        ?.map(
          (dynamic e) => ActiveCompetitionsModel.fromJson(e as Map<String, dynamic>),
        )
        .toList(growable: false);

Map<String, dynamic>? localTeamToJson(LocalTeamModel? localTeam) => localTeam?.toJson();

LocalTeamModel localTeamFromJson(Map<String, dynamic> json) => LocalTeamModel.fromJson(json);

Map<String, dynamic>? scoreModelToJson(ScoreModel? scoreModel) => scoreModel?.toJson();

ScoreModel? scoreModelFromJson(Map<String, dynamic>? json) => json != null ? ScoreModel.fromJson(json) : null;

Map<String, dynamic>? oddsModelToJson(OddsModel? oddsModel) => oddsModel?.toJson();

OddsModel? oddsModelFromJson(Map<String, dynamic>? json) => json != null ? OddsModel.fromJson(json) : null;

Map<String, dynamic>? seasonModelToJson(SeasonModel? oddsModel) => oddsModel?.toJson();

SeasonModel? seasonModelFromJson(Map<String, dynamic>? json) => json != null ? SeasonModel.fromJson(json) : null;

List<Map<String, dynamic>>? refereesModelToJson(
  List<RefereesModel>? areaModel,
) =>
    areaModel?.map((e) => e.toJson()).toList(growable: false);

List<RefereesModel>? refereesModelFromJson(List<dynamic>? json) =>
    json?.map((dynamic e) => RefereesModel.fromJson(e as Map<String, dynamic>)).toList(growable: false);

List<Map<String, dynamic>>? competitionsToJson(
  CompetitionsModel? competitions,
) =>
    competitions?.map((e) => e.toJson()).toList(growable: false);

List<CompetitionModel>? competitionsFromJson(List<dynamic>? json) => json
    ?.map(
      (dynamic e) => CompetitionModel.fromJson(e as Map<String, dynamic>),
    )
    .toList(growable: false);

List<Map<String, dynamic>> matchesToJson(MatchesModel competitions) =>
    competitions.map((e) => e.toJson()).toList(growable: false);

List<MatchModel> matchesFromJson(List<dynamic> json) =>
    json.map((dynamic e) => MatchModel.fromJson(e as Map<String, dynamic>)).toList(growable: false);

Map<String, dynamic> teamModelToJson(TeamModel teamModel) => teamModel.toJson();

Map<String, dynamic>? winnerToJson(WinnerModel? winnerModel) => winnerModel?.toJson();

WinnerModel? winnerFromJson(Map<String, dynamic>? json) => json != null ? WinnerModel.fromJson(json) : null;
