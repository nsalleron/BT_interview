import 'package:flutball/domain/entities/competition.dart';
import 'package:flutball/presentation/competition/components/club_icon.dart';
import 'package:flutball/presentation/competition/views/global_header_information.dart';
import 'package:flutter/material.dart';

class CompetitionHeader extends StatelessWidget {
  const CompetitionHeader({
    Key? key,
    required Competition comp,
  })  : _comp = comp,
        super(key: key);
  final Competition _comp;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [GlobalHeaderInformation(comp: _comp), CompetitionIcon(url: _comp.emblemUrl)],
          ),
        ],
      ),
    );
  }
}
