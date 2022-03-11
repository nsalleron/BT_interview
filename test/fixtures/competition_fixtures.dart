import 'package:flutball/domain/entities/area.dart';
import 'package:flutball/domain/entities/competition.dart';
import 'package:flutball/domain/entities/current_season.dart';
import 'package:flutball/domain/entities/winner.dart';

Competition competitionFixture({
  int withId = 1,
  Area withArea = const Area(id: 1, name: 'aCompetitionName'),
  String withPlan = 'aPlan',
  String? withEmblemUrl,
  int withNumberOfAvailableSeasons = 1,
  String withName = 'aName',
  String withLastUpdated = '2018-07-15',
  String withCode = 'aCode',
  CurrentSeason withCurrentSeason = const CurrentSeason(
    id: 1,
    currentMatchday: 1,
    startDate: '2018-06-14',
    endDate: '2018-07-15',
    winner: Winner(
      id: 1,
      name: 'aName',
      shortName: 'aShortName',
      tla: 'aTla',
      crestUrl: 'aCrestUrl',
    ),
  ),
}) {
  return Competition(
    id: withId,
    area: withArea,
    plan: withPlan,
    emblemUrl: withEmblemUrl,
    numberOfAvailableSeasons: withNumberOfAvailableSeasons,
    name: withName,
    lastUpdated: withLastUpdated,
    code: withCode,
    currentSeason: withCurrentSeason,
  );
}
