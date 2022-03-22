import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutball/core/params/image_request_params.dart';
import 'package:flutball/core/resources/data_state.dart';
import 'package:flutball/data/datasources/remote/image_api_service.dart';
import 'package:retrofit/dio.dart';

import 'image_repository.dart';

import 'package:flutball/data/repositories/extensions.dart';

class ImageRepositoryImpl implements ImageRepository {
  ImageRepositoryImpl({
    required ImageApiService imageApiService,
    Options? imageRepositoryOptions,
  })  : _imageApiService = imageApiService,
        _imageRepositoryOptions = imageRepositoryOptions ?? buildCacheOptions(const Duration(minutes: 10));

  final ImageApiService _imageApiService;
  final Options _imageRepositoryOptions;

  @override
  Future<DataState<Uint8List>> getImage(ImageRequestParams params) async {
    final HttpResponse<Uint8List?> response = await _imageApiService.getImage(params.urlImage, params.isSvg, _imageRepositoryOptions);
    return response.whenSuccessOrDefaultError<Uint8List>(
      (Uint8List p0) => p0,
    );
  }
}
