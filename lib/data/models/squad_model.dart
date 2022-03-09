import 'package:flutball/domain/entities/squad.dart';
import 'package:json_annotation/json_annotation.dart';

part 'squad_model.g.dart';

@JsonSerializable()
class SquadModel extends Squad {
  const SquadModel({
    int? id,
    String? name,
    String? position,
    String? dateOfBirth,
    String? countryOfBirth,
    String? nationality,
    int? shirtNumber,
    String? role,
  }) : super(
          id: id,
          name: name,
          position: position,
          dateOfBirth: dateOfBirth,
          countryOfBirth: countryOfBirth,
          nationality: nationality,
          shirtNumber: shirtNumber,
          role: role,
        );

  factory SquadModel.fromJson(Map<String, dynamic> json) => _$SquadModelFromJson(json);

  Map<String, dynamic> toJson() => _$SquadModelToJson(this);
}
