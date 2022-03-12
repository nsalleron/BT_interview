import 'package:flutball/domain/entities/odds.dart';
import 'package:json_annotation/json_annotation.dart';

part 'odds_model.g.dart';

@JsonSerializable()
class OddsModel extends Odds {
  const OddsModel({String? msg}) : super(msg: msg);

  factory OddsModel.fromJson(Map<String, dynamic> json) => _$OddsModelFromJson(json);

  Map<String, dynamic> toJson() => _$OddsModelToJson(this);
}
