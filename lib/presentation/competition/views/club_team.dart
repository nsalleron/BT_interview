import 'package:flutball/core/utils/dimens.dart';
import 'package:flutball/domain/entities/team.dart';
import 'package:flutball/presentation/competition/components/club_icon.dart';
import 'package:flutball/presentation/competition/components/key_title_and_bold_value.dart';
import 'package:flutball/presentation/extensions/extensions.dart';
import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
                    title: AppLocalizations.of(context)?.club_area,
                    value: _team.area?.name,
                  ),
                  KeyTitleAndBoldValueText(
                    title: AppLocalizations.of(context)?.club_address,
                    value: _team.address,
                  ),
                  KeyTitleAndBoldValueText(
                    title: AppLocalizations.of(context)?.club_website,
                    value: _team.website,
                  ),
                  KeyTitleAndBoldValueText(
                    title: AppLocalizations.of(context)?.club_email,
                    value: _team.email,
                  ),
                  KeyTitleAndBoldValueText(
                    title: AppLocalizations.of(context)?.club_founded,
                    value: _team.founded?.toString(),
                  ),
                  KeyTitleAndBoldValueText(
                    title: AppLocalizations.of(context)?.club_venue,
                    value: _team.venue,
                  )
                ],
              ),
            ),
            CompetitionIcon(url: _team.crestUrl)
          ],
        ),
      ),
    );
  }
}
