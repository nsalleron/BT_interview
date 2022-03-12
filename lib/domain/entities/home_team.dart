import 'package:equatable/equatable.dart';

class LocalTeam extends Equatable {
  const LocalTeam({
    required this.id,
    this.name,
  });

  final int id;
  final String? name;

  @override
  List<Object?> get props => [
        id,
        name,
      ];

  @override
  bool? get stringify => true;
}
