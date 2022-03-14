import 'package:flutball/core/utils/dimens.dart';
import 'package:flutball/domain/entities/squad.dart';
import 'package:flutball/presentation/competition/components/text_with_bold_value.dart';
import 'package:flutter/material.dart';
import 'package:i18n/i18n.dart';
import 'package:intl/intl.dart';

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
                  TextWithBoldValue(
                    title: I18n.current.team_playerName,
                    value: e.name,
                  ),
                  TextWithBoldValue(
                    title: I18n.current.team_playerPosition,
                    value: e.position,
                  ),
                  if (e.dateOfBirth != null)
                    TextWithBoldValue(
                      title: I18n.current.team_playerDateOfBirth,
                      value: _format.format(DateTime.parse(e.dateOfBirth ?? '')),
                    ),
                  TextWithBoldValue(
                    title: I18n.current.competition_country,
                    value: e.countryOfBirth,
                  ),
                  TextWithBoldValue(
                    title: I18n.current.team_playerNationality,
                    value: e.nationality,
                  ),
                  TextWithBoldValue(
                    title: I18n.current.team_playerRole,
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
