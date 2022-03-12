import 'package:flutball/domain/entities/squad.dart';
import 'package:flutball/presentation/competition/components/key_title_and_bold_value.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Players extends StatelessWidget {
  Players({
    Key? key,
    required this.squad,
  }) : super(key: key);

  final List<Squad> squad;
  final DateFormat _format = DateFormat('yyyy-MM-dd');

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        ...squad.map(
          (e) => Card(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.max,
                children: [
                  KeyTitleAndBoldValueText(
                    title: 'Player name: ',
                    value: e.name,
                  ),
                  KeyTitleAndBoldValueText(
                    title: 'Player position: ',
                    value: e.position,
                  ),
                  KeyTitleAndBoldValueText(
                    title: 'Player date of birth: ',
                    value: _format.format(DateTime.parse(e.dateOfBirth ?? '')),
                  ),
                  KeyTitleAndBoldValueText(
                    title: 'Player country: ',
                    value: e.countryOfBirth,
                  ),
                  KeyTitleAndBoldValueText(
                    title: 'Player nationality: ',
                    value: e.nationality,
                  ),
                  KeyTitleAndBoldValueText(
                    title: 'Player role: ',
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
