import 'package:flutball/domain/entities/competition.dart';
import 'package:flutball/presentation/competition/components/club_icon.dart';
import 'package:flutball/presentation/competition/views/global_header_information.dart';
import 'package:flutter/material.dart';

class CompetitionHeader extends StatelessWidget {
  const CompetitionHeader({
    Key? key,
    required this.comp,
  }) : super(key: key);
  final Competition comp;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GlobalHeaderInformation(comp: comp),
              ClubIcon(url: comp.emblemUrl)
            ],
          ),
        ],
      ),
    );
  }
}
