import 'package:equatable/equatable.dart';

class Odds extends Equatable {
  final String? msg;

  const Odds({
    this.msg,
  });

  @override
  List<Object?> get props => [
        msg,
      ];

  @override
  bool? get stringify => true;
}
