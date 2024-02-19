import 'dart:io';

import 'package:dio/dio.dart';

extension DioErrorX on DioError {
  bool get isNoConnection =>
      (type == DioErrorType.unknown ||
          type == DioErrorType.connectionTimeout ||
          type == DioErrorType.connectionError) &&
      error is SocketException;

  bool get isBadRequest => (400 <= (response?.statusCode ?? -1) && (response?.statusCode ?? -1) < 500);
}

extension ResponceX on Response {
  bool get isSuccessful => (200 <= (statusCode ?? 499) && (statusCode ?? 499) < 300);
}
