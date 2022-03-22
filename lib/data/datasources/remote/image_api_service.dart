import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

class ImageApiService {
  ImageApiService(this._dio);

  final Dio _dio;

  Future<HttpResponse<Uint8List?>> getImage(String url, bool isSvg, Options imageOptions) async {
    final Response<Uint8List> response;

    if (isSvg) {
      final Response<String> stringResponse = await _dio.getUri<String>(Uri.parse(url), options: imageOptions);
      response = Response(
        data: Uint8List.fromList(stringResponse.data?.codeUnits ?? []),
        requestOptions: stringResponse.requestOptions,
      );
    } else {
      final Response<List<int>> intListResponse = await _dio.getUri<List<int>>(
        Uri.parse(url),
        options: imageOptions.copyWith(
          responseType: isSvg == false ? ResponseType.bytes : null,
        ),
      );
      response = Response(
        data: Uint8List.fromList(intListResponse.data ?? []),
        requestOptions: intListResponse.requestOptions,
      );
    }

    return HttpResponse(response.data, response);
  }
}
