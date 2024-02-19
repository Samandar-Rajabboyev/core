import 'package:core/extensions/dio_error.dart';
import 'package:core/resources/base_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart' as retrofit;

import '../app.dart';
import 'data_state.dart';

mixin BaseRepository {
  Future<DataState<T?>> handleResponse<T>(
      {required Future<retrofit.HttpResponse<BaseResponse<T>>> response, T Function(T? param)? next}) async {
    try {
      final httpResponse = await response;
      return DataSuccess(
        data: (next == null ? httpResponse.data.data : next((httpResponse.data.data))),
        message: messageConverter(httpResponse.response),
        accept: httpResponse.data.accept,
        code: httpResponse.response.statusCode,
      );
    } on DioError catch (e) {
      print(e.type.name);
      if (e.isNoConnection) {
        return DataFailed(message: badInternetConnection);
      } else if (e.isBadRequest) {
        return DataFailed(message: messageConverter(e.response));
      } else {
        final message = appError;
        return DataFailed(message: message);
      }
    }
  }

  Future<DataState<T>> handleResponseOld<T>(
      {required Future<retrofit.HttpResponse<T>> response, T Function(T param)? next}) async {
    try {
      final httpResponse = await response;
      return DataSuccess(
        data: next == null ? httpResponse.data : next((httpResponse.data)),
        message: messageConverter(httpResponse.response),
        code: httpResponse.response.statusCode,
      );
    } on DioError catch (e) {
      if (e.isNoConnection) {
        final message = badInternetConnection;
        return DataFailed(message: message);
      } else if (e.isBadRequest) {
        final message = e.response?.data?['message'] ?? 'Bad request';
        return DataFailed(message: message);
      } else {
        final message = appError;
        return DataFailed(message: message);
      }
    }
  }
}
