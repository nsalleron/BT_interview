import 'package:flutball/domain/entities/area.dart';
import 'package:json_annotation/json_annotation.dart';
part 'area_model.g.dart';

@JsonSerializable()
class AreaModel extends Area {
  const AreaModel({
    int? id,
    String? name,
  }) : super(id: id, name: name);

  factory AreaModel.fromJson(Map<String, dynamic> json) => _$AreaModelFromJson(json);

  Map<String, dynamic> toJson() => _$AreaModelToJson(this);
}
