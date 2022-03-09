import 'package:equatable/equatable.dart';
import 'package:flutball/domain/entities/active_competitions.dart';
import 'package:flutball/domain/entities/area.dart';
import 'package:flutball/domain/entities/squad.dart';

class Team extends Equatable {
  final int? id;
  final Area? area;
  final List<ActiveCompetitions>? activeCompetitions;
  final String? name;
  final String? shortName;
  final String? tla;
  final String? crestUrl;
  final String? address;
  final String? phone;
  final String? website;
  final String? email;
  final int? founded;
  final String? clubColors;
  final String? venue;
  final List<Squad>? squad;
  final String? lastUpdated;

  const Team({
    this.id,
    this.area,
    this.activeCompetitions,
    this.name,
    this.shortName,
    this.tla,
    this.crestUrl,
    this.address,
    this.phone,
    this.website,
    this.email,
    this.founded,
    this.clubColors,
    this.venue,
    this.squad,
    this.lastUpdated,
  });

  @override
  List<Object?> get props => [
        id,
        area,
        activeCompetitions,
        name,
        shortName,
        tla,
        crestUrl,
        address,
        phone,
        website,
        email,
        founded,
        clubColors,
        venue,
        squad,
        lastUpdated,
      ];

  @override
  bool? get stringify => true;
}
