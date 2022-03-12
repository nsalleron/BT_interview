import 'package:flutball/domain/entities/competition.dart';
import 'package:flutball/presentation/competition/components/key_title_and_bold_value.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

class GlobalHeaderInformation extends StatelessWidget {
  GlobalHeaderInformation({
    Key? key,
    required this.comp,
  }) : super(key: key);

  final DateFormat _format = DateFormat('yyyy-MM-dd HH:mm:ss');
  final Competition comp;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            KeyTitleAndBoldValueText(
              title: AppLocalizations.of(context)?.competition_title ?? '',
              value: comp.name,
            ),
            KeyTitleAndBoldValueText(
              title: AppLocalizations.of(context)?.competition_country ?? '',
              value: comp.area?.name,
            ),
            KeyTitleAndBoldValueText(
              title: 'start date: ',
              value: comp.currentSeason.startDate,
            ),
            KeyTitleAndBoldValueText(
              title: 'end date: ',
              value: comp.currentSeason.endDate,
            ),
            KeyTitleAndBoldValueText(
              title: 'Last update: ',
              value: _format.format(DateTime.parse(comp.lastUpdated)),
            ),
          ],
        ),
      ),
    );
  }
}
