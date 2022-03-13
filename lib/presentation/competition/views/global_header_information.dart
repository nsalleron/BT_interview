import 'package:flutball/core/utils/dimens.dart';
import 'package:flutball/domain/entities/competition.dart';
import 'package:flutball/presentation/competition/components/key_title_and_bold_value.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
            KeyTitleAndBoldValueText(
              title: AppLocalizations.of(context)?.competition_title,
              value: _comp.name,
            ),
            KeyTitleAndBoldValueText(
              title: AppLocalizations.of(context)?.competition_country,
              value: _comp.area?.name,
            ),
            KeyTitleAndBoldValueText(
              title: AppLocalizations.of(context)?.competition_startDate,
              value: _comp.currentSeason.startDate,
            ),
            KeyTitleAndBoldValueText(
              title: AppLocalizations.of(context)?.competition_endDate,
              value: _comp.currentSeason.endDate,
            ),
            KeyTitleAndBoldValueText(
              title: AppLocalizations.of(context)?.competition_lastUpdate,
              value: _format.format(DateTime.parse(_comp.lastUpdated)),
            ),
          ],
        ),
      ),
    );
  }
}
