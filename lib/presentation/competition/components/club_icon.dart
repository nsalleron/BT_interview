import 'package:flutball/core/utils/dimens.dart';
import 'package:flutball/injector.dart';
import 'package:flutball/presentation/competition/logic/image_fetcher_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

const _edgeSize = 100.0;

class CompetitionIcon extends StatelessWidget {
  const CompetitionIcon({
    Key? key,
    required this.url,
  }) : super(key: key);

  final String? url;
  static const icon = Icon(
    Icons.report_problem,
    size: _edgeSize,
  );

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(Dimens.halfPadding),
        child: BlocBuilder<ImageFetcherCubit, ImageFetcherState>(
          bloc: ImageFetcherCubit(getImageUseCase: appInjector())..fetchImage(url),
          builder: (BuildContext context, ImageFetcherState state) {
            if (state is ImageFetcherLoadInProgress) {
              return const CircularProgressIndicator();
            }

            if (state is ImageFetcherLoadSuccess) {
              if (state.isSvg) {
                return SvgPicture.memory(
                  state.imageData,
                  width: _edgeSize,
                  height: _edgeSize,
                  fit: BoxFit.fitWidth,
                );
              } else {
                return Image.memory(
                  state.imageData,
                  height: _edgeSize,
                  width: _edgeSize,
                  fit: BoxFit.fitWidth,
                  errorBuilder: (context, error, stackTrace) => icon,
                );
              }
            }
            return icon;
          },
        ),
      );
}
