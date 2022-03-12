import 'package:flutball/domain/entities/team.dart';
import 'package:flutball/presentation/competition/components/club_icon.dart';
import 'package:flutball/presentation/competition/components/key_title_and_bold_value.dart';
import 'package:flutball/presentation/extensions/extensions.dart';
import 'package:flutter/material.dart';

class ClubTeam extends StatelessWidget {
  const ClubTeam({
    Key? key,
    required this.team,
  }) : super(key: key);

  final Team team;

  @override
  Widget build(BuildContext context) {
    final gradient = team.clubColors?.toColors() ?? [];
    return Card(
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: gradient.isNotEmpty
            ? BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: gradient,
                ),
              )
            : null,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  KeyTitleAndBoldValueText(
                    title: 'Area : ',
                    value: team.area?.name,
                  ),
                  KeyTitleAndBoldValueText(
                    title: 'Address : ',
                    value: team.address,
                  ),
                  KeyTitleAndBoldValueText(
                    title: 'Website : ',
                    value: team.website,
                  ),
                  KeyTitleAndBoldValueText(
                    title: 'Email : ',
                    value: team.email,
                  ),
                  KeyTitleAndBoldValueText(
                    title: 'Founded : ',
                    value: team.founded?.toString(),
                  ),
                  KeyTitleAndBoldValueText(
                    title: 'Venue : ',
                    value: team.venue,
                  )
                ],
              ),
            ),
            ClubIcon(url: team.crestUrl)
          ],
        ),
      ),
    );
  }
}
