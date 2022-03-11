import 'package:flutball/domain/entities/active_competitions.dart';
import 'package:flutball/domain/entities/area.dart';
import 'package:flutball/domain/entities/squad.dart';
import 'package:flutball/domain/entities/team.dart';

Team teamFixture({
  int? withId = 0,
  Area? withArea = const Area(),
  List<ActiveCompetitions>? withActiveCompetitions = const [],
  String? withName = 'aName',
  String? withShortName = 'aShortName',
  String? withTla = 'aTla',
  String? withCrestUrl = 'aCrestUrl',
  String? withAddress = 'aAddress',
  String? withPhone = 'aPhone',
  String? withWebsite = 'aWebsite',
  String? withEmail = 'aEmail',
  int? withFounded = 0,
  String? withClubColors = 'aClubColors',
  String? withVenue = 'aVenue',
  List<Squad>? withSquad = const [],
  String? withLastUpdated = 'aLastUpdate',
}) {
  return Team(
    id: withId,
    area: withArea,
    activeCompetitions: withActiveCompetitions,
    name: withName,
    shortName: withShortName,
    tla: withTla,
    crestUrl: withCrestUrl,
    address: withAddress,
    phone: withPhone,
    website: withWebsite,
    email: withEmail,
    founded: withFounded,
    clubColors: withClubColors,
    venue: withVenue,
    squad: withSquad,
    lastUpdated: withLastUpdated,
  );
}
