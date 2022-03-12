import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';

extension TextColorsExtension on String {
  List<Color> toColors() {
    return toLowerCase()
        .replaceAll(' ', '')
        .split('/')
        .map((e) {
          if (e == 'blue') {
            return Colors.blue;
          } else if (e == 'black') {
            return Colors.black;
          } else if (e == 'white') {
            return Colors.white;
          } else if (e == 'red') {
            return Colors.red;
          } else if (e == 'green') {
            return Colors.green;
          } else if (e == 'yellow') {
            return Colors.yellow;
          } else if (e == 'navyblue') {
            return Colors.blueAccent;
          } else if (e == 'orange') {
            return Colors.orange;
          }
          return null;
        })
        .whereNotNull()
        .reversed
        .toList(growable: false);
  }
}
