import 'package:flutball/presentation/competition/components/circular_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:path/path.dart' as p;

const _edgeSize = 100.0;

class ClubIcon extends StatelessWidget {
  const ClubIcon({
    Key? key,
    required this.url,
  }) : super(key: key);

  final String? url;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(8),
        child: () {
          if (url == null) {
            return const Icon(
              Icons.report_problem,
              size: _edgeSize,
            );
          }
          if (p.extension(url!) != '.svg') {
            return Image.network(
              url!,
              height: _edgeSize,
              width: _edgeSize,
              fit: BoxFit.fitWidth,
            );
          } else {
            return _NetworkIcon(url: url!);
          }
        }(),
      );
}

class _NetworkIcon extends StatelessWidget {
  const _NetworkIcon({
    Key? key,
    required this.url,
  }) : super(key: key);

  final String url;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.network(
      url,
      width: _edgeSize,
      height: _edgeSize,
      fit: BoxFit.fitWidth,
      placeholderBuilder: (BuildContext context) => const Icon(
        Icons.report_problem,
        size: _edgeSize,
      ),
    );
  }
}
