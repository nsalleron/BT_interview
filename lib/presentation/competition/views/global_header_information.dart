import 'package:flutball/core/utils/dimens.dart';
import 'package:flutball/domain/entities/competition.dart';
import 'package:flutball/presentation/competition/components/text_with_bold_value.dart';
import 'package:flutter/widgets.dart';
import 'package:i18n/i18n.dart';
import 'package:intl/intl.dart';

class GlobalHeaderInformation extends StatelessWidget {
  GlobalHeaderInformation({
    Key? key,
    required Competition comp,
  })  : _comp = comp,
        super(key: key);

  final DateFormat _format = DateFormat('yyyy-MM-dd HH:mm:ss');
  final Competition _comp;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.all(Dimens.halfPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWithBoldValue(
              title: I18n.current.competition_title,
              value: _comp.name,
            ),
            TextWithBoldValue(
              title: I18n.current.competition_country,
              value: _comp.area?.name,
            ),
            TextWithBoldValue(
              title: I18n.current.competition_startDate,
              value: _comp.currentSeason.startDate,
            ),
            TextWithBoldValue(
              title: I18n.current.competition_endDate,
              value: _comp.currentSeason.endDate,
            ),
            TextWithBoldValue(
              title: I18n.current.competition_lastUpdate,
              value: _format.format(DateTime.parse(_comp.lastUpdated)),
            ),
          ],
        ),
      ),
    );
  }
}
