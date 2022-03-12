import 'package:dio/dio.dart';

abstract class DataState<T> {

  const DataState({this.data, this.error});

  final T? data;
  final DioError? error;
}

class DataSuccess<T> extends DataState<T> {
  DataSuccess(T data) : super(data: data);
}

class DataFailed<T> extends DataState<T> {
  DataFailed(DioError error) : super(error: error);
}

extension DataStateExtension<T> on DataState<T> {
  S when<S>(OnSuccess<T, S> onSuccess, OnError<S> onError) {
    if (data != null) {
      return onSuccess(data!);
    } else if (error != null) {
      return onError(error!);
    } //should not happen
    return onError(error!);
  }
}

typedef OnSuccess<T, S> = S Function(T);
typedef OnError<S> = S Function(DioError);
