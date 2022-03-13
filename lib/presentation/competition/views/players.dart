import 'package:flutball/core/utils/dimens.dart';
import 'package:flutball/domain/entities/squad.dart';
import 'package:flutball/presentation/competition/components/key_title_and_bold_value.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Players extends StatelessWidget {
  Players({
    Key? key,
    required List<Squad> squad,
  })  : _squad = squad,
        super(key: key);

  final List<Squad> _squad;
  final DateFormat _format = DateFormat('yyyy-MM-dd');

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        ..._squad.map(
          (e) => Card(
            child: Padding(
              padding: const EdgeInsets.all(Dimens.halfPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.max,
                children: [
                  KeyTitleAndBoldValueText(
                    title: AppLocalizations.of(context)?.team_playerName,
                    value: e.name,
                  ),
                  KeyTitleAndBoldValueText(
                    title: AppLocalizations.of(context)?.team_playerPosition,
                    value: e.position,
                  ),
                  if (e.dateOfBirth != null)
                    KeyTitleAndBoldValueText(
                      title: AppLocalizations.of(context)?.team_playerDateOfBirth,
                      value: _format.format(DateTime.parse(e.dateOfBirth ?? '')),
                    ),
                  KeyTitleAndBoldValueText(
                    title: AppLocalizations.of(context)?.competition_country,
                    value: e.countryOfBirth,
                  ),
                  KeyTitleAndBoldValueText(
                    title: AppLocalizations.of(context)?.team_playerNationality,
                    value: e.nationality,
                  ),
                  KeyTitleAndBoldValueText(
                    title: AppLocalizations.of(context)?.team_playerRole,
                    value: e.role,
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
