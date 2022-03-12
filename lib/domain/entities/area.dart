import 'package:equatable/equatable.dart';

class Area extends Equatable {
  const Area({
    this.id,
    this.name,
  });

  final int? id;
  final String? name;

  @override
  List<Object?> get props => [
        id,
        name,
      ];

  @override
  bool? get stringify => true;
}
