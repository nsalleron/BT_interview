import 'package:equatable/equatable.dart';

class Area extends Equatable {
  final int? id;
  final String? name;

  const Area({
    this.id,
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
