import 'package:flutball/domain/entities/home_team.dart';
import 'package:flutball/domain/entities/match.dart';

Match matchFixture({
  int withId = 1,
  String withLastUpdated = 'aLastUpdated',
  LocalTeam withHomeTeam = const LocalTeam(id: 0, name: 'aHomeTeamName'),
  LocalTeam withAwayTeam = const LocalTeam(id: 1, name: 'aAwayTeam'),
}) {
  return Match(
    id: withId,
    lastUpdated: withLastUpdated,
    homeTeam: withHomeTeam,
    awayTeam: withAwayTeam,
  );
}
