import 'package:habit_tracker/src/core/extensions/dio_error.dart';
import 'package:retrofit/retrofit.dart' as retrofit;
import 'package:dio/dio.dart';
import '../../../generated/l10n.dart';
import '../router/route_config.dart';
import 'data_state.dart';

mixin BaseRepository {
  Future<DataState<T>> handleResponse<T>(
      {required Future<retrofit.HttpResponse<T>> response, T Function(T param)? next}) async {
    final context = rootNavigator.currentContext;
    try {
      final httpResponse = await response;
      return DataSuccess(next == null ? httpResponse.data : next((httpResponse.data)));
    } on DioError catch (e) {
      if (e.isNoConnection || e.isBadConnection) {
        final message = S.of(context!).badInternetConnection;
        return DataFailed(message: message);
      } else if (e.isBadRequest) {
        final message = e.response?.data?['message']['ru'] ?? 'Bad request';
        return DataFailed(message: message);
      } else {
        final message = S.of(context!).appError;
        return DataFailed(message: message);
      }
    }
  }
}
