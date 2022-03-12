import 'package:equatable/equatable.dart';

class Odds extends Equatable {


  const Odds({
    this.msg,
  });

  final String? msg;

  @override
  List<Object?> get props =>
      [
        msg,
      ];

  @override
  bool? get stringify => true;
}
