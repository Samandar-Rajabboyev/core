abstract class DataState<T> {
  final T? data;
  final String? message;
  final int? code;
  final bool? accept;

  const DataState({this.data, this.message, this.code, this.accept});
}

class DataSuccess<T> extends DataState<T> {
  const DataSuccess({
    required T data,
    String? message,
    bool? accept,
    int? code,
  }) : super(
          data: data,
          message: message,
          accept: accept,
          code: code,
        );
}

class DataFailed<T> extends DataState<T> {
  const DataFailed({required String message, int? code}) : super(message: message, code: code);
}
