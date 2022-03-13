import 'package:flutter/widgets.dart';

class KeyTitleAndBoldValueText extends StatelessWidget {
  const KeyTitleAndBoldValueText({
    Key? key,
    required String? title,
    required String? value,
  })  : _title = title,
        _value = value,
        super(key: key);

  final String? _title;
  final String? _value;

  @override
  Widget build(BuildContext context) {
    return RichText(
      textScaleFactor: MediaQuery.of(context).textScaleFactor,
      text: TextSpan(
        style: DefaultTextStyle.of(context).style,
        children: [
          TextSpan(text: _title ?? ''),
          TextSpan(
            text: _value,
            style: const TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
      overflow: TextOverflow.ellipsis,
    );
  }
}
