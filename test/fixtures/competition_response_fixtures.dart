import 'package:flutball/data/models/helpers/types_helper.dart';
import 'package:flutball/data/models/responses/competition_response_model.dart';

CompetitionResponseModel competitionResponseModelFixture({
  int withCount = 1,
  CompetitionsModel withCompetitions = const [],
}) {
  return CompetitionResponseModel(
    count: withCount,
    competitions: withCompetitions,
  );
}
