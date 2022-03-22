import 'package:flutball/core/utils/dimens.dart';
import 'package:flutball/domain/entities/team.dart';
import 'package:flutball/presentation/competition/components/club_icon.dart';
import 'package:flutball/presentation/competition/components/text_with_bold_value.dart';
import 'package:flutball/presentation/extensions/extensions.dart';
import 'package:flutter/material.dart';

import 'package:i18n/i18n.dart';

class ClubTeam extends StatelessWidget {
  const ClubTeam({
    Key? key,
    required Team team,
  })  : _team = team,
        super(key: key);

  final Team _team;

  @override
  Widget build(BuildContext context) {
    final gradient = _team.clubColors?.toColors() ?? [];
    return Card(
      child: Container(
        padding: const EdgeInsets.all(Dimens.halfPadding),
        decoration: gradient.isNotEmpty && gradient.length > 2
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
                  TextWithBoldValue(
                    title: I18n.current.club_name,
                    value: '${_team.name} / ${_team.shortName}',
                  ),
                  TextWithBoldValue(
                    title: I18n.current.club_area,
                    value: _team.area?.name,
                  ),
                  TextWithBoldValue(
                    title: I18n.current.club_address,
                    value: _team.address,
                  ),
                  TextWithBoldValue(
                    title: I18n.current.club_website,
                    value: _team.website,
                  ),
                  TextWithBoldValue(
                    title: I18n.current.club_email,
                    value: _team.email,
                  ),
                  TextWithBoldValue(
                    title: I18n.current.club_founded,
                    value: _team.founded?.toString(),
                  ),
                  TextWithBoldValue(
                    title: I18n.current.club_venue,
                    value: _team.venue,
                  )
                ],
              ),
            ),
            CompetitionIcon(url: _team.crestUrl ??'')
          ],
        ),
      ),
    );
  }
}
