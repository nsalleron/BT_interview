import 'package:flutball/data/models/helpers/types_helper.dart';
import 'package:flutball/data/models/responses/match_response_model.dart';

MatchResponseModel matchResponseFixture({
  int withCount = 1,
  MatchesModel withMatches = const [],
}) {
  return MatchResponseModel(count: withCount, matches: withMatches);
}
