import 'package:equatable/equatable.dart';
import 'package:flutball/domain/entities/stop_time.dart';

class Score extends Equatable {
  const Score({
    this.winner,
    this.duration,
    this.fullTime,
    this.halfTime,
    this.extraTime,
    this.penalties,
  });

  final String? winner;
  final String? duration;
  final StopTime? fullTime;
  final StopTime? halfTime;
  final StopTime? extraTime;
  final StopTime? penalties;

  @override
  List<Object?> get props => [
        winner,
        duration,
        fullTime,
        halfTime,
        extraTime,
        penalties,
      ];

  @override
  bool? get stringify => true;
}
