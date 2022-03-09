import 'package:equatable/equatable.dart';

class Season extends Equatable {
  final int id;
  final String startDate;
  final String endDate;
  final int? currentMatchday;

  const Season({
    required this.id,
    required this.startDate,
    required this.endDate,
    this.currentMatchday,
  });

  @override
  List<Object?> get props => [
        id,
        startDate,
        endDate,
        currentMatchday,
      ];

  @override
  bool? get stringify => true;
}
