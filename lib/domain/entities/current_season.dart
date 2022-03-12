import 'package:equatable/equatable.dart';
import 'package:flutball/domain/entities/winner.dart';

class CurrentSeason extends Equatable {
  const CurrentSeason({
    required this.id,
    required this.startDate,
    required this.endDate,
    required this.currentMatchday,
    required this.winner,
  });

  final int id;
  final String startDate;
  final String endDate;
  final int? currentMatchday;
  final Winner? winner;

  @override
  List<Object?> get props => [
        id,
        startDate,
        endDate,
        currentMatchday,
        winner,
      ];

  @override
  bool? get stringify => true;
}
