import 'package:flutball/data/models/responses/team_response_model.dart';
import 'package:flutball/data/models/team_model.dart';

TeamResponseModel teamResponseFixture({
  TeamModel withTeam = const TeamModel(),
}) {
  return TeamResponseModel(team: withTeam);
}
