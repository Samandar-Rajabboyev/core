// ignore_for_file: depend_on_referenced_packages

import 'package:dio/dio.dart';
import '../services/services.dart';

class TokenInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // await Prefs.reload();
    // var userModel = await AuthStorageService.getUser();
    // if (userModel != null) {
    //   options.headers['Authorization'] = "Bearer ${userModel.token ?? ''}";
    // }
    LogService.request(options);
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    LogService.response(response);
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    LogService.errorResponse(err);
    super.onError(err, handler);
  }

  Future<void> sendToTelegram(
    DioError err,
  ) async {
    //   if (err.response?.statusCode != null) {
    //     if ((err.response?.statusCode)! >= 500) {
    //       String message = """
    //         HTTP EXCEPTION {
    //         PLATFORM: ${Platform.operatingSystem},
    //         App version: ${await PackageInfo.fromPlatform().then((value) => value.version)}
    //         BaseUri: ${err.requestOptions.baseUrl},
    //         Uri: ${err.requestOptions.path},
    //         Body: ${err.response?.requestOptions.data},
    //         Query Parameters: ${err.response?.requestOptions.queryParameters},
    //         Status Code: ${err.response?.statusCode},
    //         Data: ${err.response?.data},
    //         ERROR TYPE: ${err.type},
    //         ERROR: ${err.error}
    // }
    //         """;
    //       injector<TelegramClient>().sendMe(message, "-1001826626259");
    //     }
    //   }
  }
}
