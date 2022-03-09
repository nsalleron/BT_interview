import 'package:equatable/equatable.dart';

class Squad extends Equatable {
  final int? id;
  final String? name;
  final String? position;
  final String? dateOfBirth;
  final String? countryOfBirth;
  final String? nationality;
  final int? shirtNumber;
  final String? role;

  const Squad({
    this.id,
    this.name,
    this.position,
    this.dateOfBirth,
    this.countryOfBirth,
    this.nationality,
    this.shirtNumber,
    this.role,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        position,
        dateOfBirth,
        countryOfBirth,
        nationality,
        shirtNumber,
        role,
      ];

  @override
  bool? get stringify => true;
}
