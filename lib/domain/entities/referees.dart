import 'package:equatable/equatable.dart';

class Referees extends Equatable {
  const Referees({
    this.id,
    this.name,
    this.role,
    this.nationality,
  });

  final int? id;
  final String? name;
  final String? role;
  final String? nationality;

  @override
  List<Object?> get props => [
        id,
        name,
        role,
        nationality,
      ];

  @override
  bool? get stringify => true;
}
