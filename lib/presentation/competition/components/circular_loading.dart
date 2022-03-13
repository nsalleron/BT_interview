import 'package:flutball/core/utils/dimens.dart';
import 'package:flutter/material.dart';

class CircularLoading extends StatelessWidget {
  const CircularLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Dimens.circularProgress),
      child: const CircularProgressIndicator(),
    );
  }
}
