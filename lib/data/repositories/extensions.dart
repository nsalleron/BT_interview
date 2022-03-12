import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutball/core/resources/data_state.dart';
import 'package:retrofit/retrofit.dart';

extension HttpResponseExtension<T> on HttpResponse<T> {
  DataState<S> whenSuccessOrDefaultError<S>(OnSuccess<T, S> success) {
    if (response.statusCode == HttpStatus.ok) {
      return DataSuccess(success(data));
    }
    return DataFailed(
      DioError(
        requestOptions: response.requestOptions,
        response: response,
        error: response.statusMessage,
        type: DioErrorType.response,
      ),
    );
  }
}

typedef OnSuccess<T, S> = S Function(T);
