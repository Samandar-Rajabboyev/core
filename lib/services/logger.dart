part of 'services.dart';

class LogService {
  static final Logger _logger = Logger(
    filter: DevelopmentFilter(),
    printer: PrettyPrinter(
      methodCount: 0,
    ),
  );

  static void d(String? message) {
    _logger.d(message);
  }

  static void i(String? message) {
    _logger.i(message);
  }

  static void w(String? message) {
    _logger.w(message);
  }

  static void e(String? message) {
    _logger.e(message);
  }

  static void request(RequestOptions requestOptions) {
    String queries = requestOptions.queryParameters.isEmpty ? '' : '?';
    requestOptions.queryParameters.forEach((key, value) {
      queries = '$queries$key=$value';
    });
    _logger.w(
      'REQUEST: ${requestOptions.method} ${requestOptions.baseUrl}${requestOptions.path}$queries;\n'
      'HEADER: ${requestOptions.headers};\n'
      'PARAM: ${requestOptions.data}',
    );
  }

  static void response(Response response) {
    if (response.isSuccessful) {
      _logger.i(
        'REQUEST: ${response.requestOptions.method} ${response.realUri};\n'
        'PARAM: ${response.requestOptions.data}\n'
        'RESPONSE: ${response.statusCode} ${response.statusMessage}\n'
        'DATA = ${response.data}',
      );
    }
  }

  static void errorResponse(DioError error) {
    if (error.isNoConnection || error.isBadConnection) {
      _logger.e('BAD CONNECTION: $badInternetConnection');
    } else {
      _logger.e(
        'ERROR: ${error.message}\n'
        'REQUEST: ${error.requestOptions.method} ${error.response?.realUri}\n'
        'PARAM: ${error.requestOptions.data}\n'
        'RESPONSE: ${error.response?.statusCode} ${error.response?.statusMessage}\n'
        'MESSAGE = ${error.response?.data?['message']}'
        'Data = ${error.response?.data}',
      );
    }
  }
}
