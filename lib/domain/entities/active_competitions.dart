import 'package:equatable/equatable.dart';
import 'package:flutball/domain/entities/area.dart';

class ActiveCompetitions extends Equatable {
  const ActiveCompetitions({
    this.id,
    this.area,
    this.name,
    this.code,
    this.plan,
    this.lastUpdated,
  });

  final int? id;
  final Area? area;
  final String? name;
  final String? code;
  final String? plan;
  final String? lastUpdated;

  @override
  List<Object?> get props => [
        id,
        area,
        name,
        code,
        plan,
        lastUpdated,
      ];

  @override
  bool? get stringify => true;
}
