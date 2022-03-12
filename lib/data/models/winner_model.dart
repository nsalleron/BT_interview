import 'package:flutball/domain/entities/winner.dart';
import 'package:json_annotation/json_annotation.dart';

part 'winner_model.g.dart';

@JsonSerializable()
class WinnerModel extends Winner {
  const WinnerModel({
    required int id,
    required String name,
    required String shortName,
    required String crestUrl,
    required String tla,
  }) : super(
          id: id,
          name: name,
          shortName: shortName,
          crestUrl: crestUrl,
          tla: tla,
        );

  factory WinnerModel.fromJson(Map<String, dynamic> json) => _$WinnerModelFromJson(json);

  Map<String, dynamic> toJson() => _$WinnerModelToJson(this);
}
