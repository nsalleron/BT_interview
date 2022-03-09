import 'package:equatable/equatable.dart';
import 'package:flutball/domain/entities/area.dart';

class ActiveCompetitions extends Equatable {
  final int? id;
  final Area? area;
  final String? name;
  final String? code;
  final String? plan;
  final String? lastUpdated;

  const ActiveCompetitions({
    this.id,
    this.area,
    this.name,
    this.code,
    this.plan,
    this.lastUpdated,
  });

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
