import 'package:equatable/equatable.dart';

class Winner extends Equatable {
  const Winner({
    required this.id,
    required this.name,
    required this.shortName,
    required this.tla,
    required this.crestUrl,
  });

  final int id;
  final String name;
  final String shortName;
  final String tla;
  final String crestUrl;

  @override
  List<Object?> get props => [id, name, shortName, tla, crestUrl];
}
