import 'package:flutter/widgets.dart';

class KeyTitleAndBoldValueText extends StatelessWidget {
  const KeyTitleAndBoldValueText({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  final String title;
  final String? value;

  @override
  Widget build(BuildContext context) {
    return RichText(
      textScaleFactor: MediaQuery.of(context).textScaleFactor,
      text: TextSpan(
        style: DefaultTextStyle.of(context).style,
        children: [
          TextSpan(text: title),
          TextSpan(
            text: value,
            style: const TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
      overflow: TextOverflow.ellipsis,
    );
  }
}
