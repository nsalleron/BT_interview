import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutball/domain/entities/competition.dart';
import 'package:flutball/domain/entities/team.dart';
import 'package:flutball/domain/usecases/get_match_usecase.dart';
import 'package:flutball/domain/usecases/get_team_usecase.dart';
import 'package:intl/intl.dart';

part 'team_state.dart';

class TeamCubit extends Cubit<TeamState> {
  TeamCubit({
    required this.getTeamUseCase,
    required this.getMatchesUseCase,
  }) : super(TeamInitial());

  GetTeamUseCase getTeamUseCase;
  GetMatchesUseCase getMatchesUseCase;

  Future<void> fetchBestTeam({required Competition competition}) async {}


}
