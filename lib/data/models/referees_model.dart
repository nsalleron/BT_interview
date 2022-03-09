import 'package:flutball/domain/entities/referees.dart';

import 'package:json_annotation/json_annotation.dart';

part 'referees_model.g.dart';
@JsonSerializable()
class RefereesModel extends Referees {
  const RefereesModel({
    int? id,
    String? name,
    String? role,
    String? nationality,
  }) : super(
          id: id,
          name: name,
          role: role,
          nationality: nationality,
        );

  factory RefereesModel.fromJson(Map<String, dynamic> json) => _$RefereesModelFromJson(json);

  Map<String, dynamic> toJson() => _$RefereesModelToJson(this);
}
