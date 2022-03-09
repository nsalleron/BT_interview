import 'package:equatable/equatable.dart';
import 'package:flutball/domain/entities/area.dart';
import 'package:flutball/domain/entities/current_season.dart';

class Competition extends Equatable {
  final int id;
  final Area? area;
  final String name;
  final String? code;
  final String? emblemUrl;
  final String plan;
  final CurrentSeason currentSeason;
  final int numberOfAvailableSeasons;
  final String lastUpdated;

  const Competition({
    required this.id,
    required this.area,
    required this.name,
    required this.code,
    required this.emblemUrl,
    required this.plan,
    required this.currentSeason,
    required this.numberOfAvailableSeasons,
    required this.lastUpdated,
  });

  @override
  List<Object?> get props => [
        id,
        area,
        name,
        code,
        emblemUrl,
        plan,
        currentSeason,
        numberOfAvailableSeasons,
        lastUpdated,
      ];

  @override
  bool? get stringify => true;
}
