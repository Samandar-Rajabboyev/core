import 'dart:io';

import 'package:dio/dio.dart';

extension DioErrorX on DioError {
  bool get isBadConnection => type == DioErrorType.connectionTimeout;

  bool get isNoConnection => type == DioErrorType.unknown && error is SocketException;

  bool get isBadRequest => (400 <= (response?.statusCode ?? 499) && (response?.statusCode ?? 499) < 500);
}

extension ResponceX on Response {
  bool get isSuccessful => (200 <= (statusCode ?? 499) && (statusCode ?? 499) < 300);
}
