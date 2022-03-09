import 'package:equatable/equatable.dart';

class StopTime extends Equatable {
  final int? homeTeam;
  final int? awayTeam;

  StopTime({this.homeTeam, this.awayTeam});

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
        homeTeam,
        awayTeam,
      ];
}
