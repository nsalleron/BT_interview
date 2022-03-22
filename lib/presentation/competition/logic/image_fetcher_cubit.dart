import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:flutball/core/params/image_request_params.dart';
import 'package:flutball/core/resources/data_state.dart';
import 'package:flutball/domain/usecases/get_image_usecase.dart';
import 'package:flutter_svg/parser.dart';
import 'package:meta/meta.dart';
import 'package:path/path.dart' as p;

part 'image_fetcher_state.dart';

class ImageFetcherCubit extends Cubit<ImageFetcherState> {
  ImageFetcherCubit({
    required GetImageUseCase getImageUseCase,
  })  : _getCompetitionUseCase = getImageUseCase,
        super(ImageFetcherInitial());

  final GetImageUseCase _getCompetitionUseCase;
  final SvgParser parser = SvgParser();

  Future<void> fetchImage(String? url, {ImageRequestParams? params}) async {
    if (url == null || url.isEmpty){
      return emit(ImageFetcherLoadFailed());
    }
    final isSvg = p.extension(url) == '.svg';
    emit(ImageFetcherLoadInProgress());
    final DataState<Uint8List> result = await _getCompetitionUseCase(params ?? ImageRequestParams(urlImage: url, isSvg: isSvg));
    result.when(
          (p0) => _parseImageOrEmitSuccess(url, p0!, isSvg),
          (p0) => ImageFetcherLoadFailed(),
    );
  }

  Future<void> _parseImageOrEmitSuccess(String url, Uint8List p0, bool isSvg) async {
    if (isSvg) {
      try {
        await parser.parse(String.fromCharCodes(p0));
        emit(
          ImageFetcherLoadSuccess(
            isSvg: p.extension(url) == '.svg',
            imageData: p0,
          ),
        );
      } on Exception catch (_) {
        emit(ImageFetcherLoadFailed());
      }
    } else {
      emit(
        ImageFetcherLoadSuccess(
          isSvg: p.extension(url) == '.svg',
          imageData: p0,
        ),
      );
    }
  }
}
