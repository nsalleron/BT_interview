import 'package:equatable/equatable.dart';

class LocalTeam extends Equatable {
  final int id;
  final String? name;

  const LocalTeam({
    required this.id,
    this.name,
  });

  @override
  List<Object?> get props => [
        id,
        name,
      ];

  @override
  bool? get stringify => true;
}
