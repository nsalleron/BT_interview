import 'dart:core';

import 'package:equatable/equatable.dart';

class ImageRequestParams extends Equatable {
  const ImageRequestParams({
    required this.urlImage,
    required this.isSvg,
  });

  final String urlImage;
  final bool isSvg;

  @override
  List<Object?> get props => [urlImage];
}
