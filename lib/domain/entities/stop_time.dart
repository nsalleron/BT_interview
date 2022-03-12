import 'package:equatable/equatable.dart';

class StopTime extends Equatable {
  const StopTime({this.homeTeam, this.awayTeam});

  final int? homeTeam;
  final int? awayTeam;

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
        homeTeam,
        awayTeam,
      ];
}
