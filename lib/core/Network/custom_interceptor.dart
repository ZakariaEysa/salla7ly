import 'package:dio/dio.dart';

class CustomRetryInterceptor extends Interceptor {
  final Dio dio;
  final int retries;
  final Duration retryDelay;

  CustomRetryInterceptor({
    required this.dio,
    this.retries = 1,
    this.retryDelay = const Duration(seconds: 2),
  });

  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    bool shouldRetry = _shouldRetry(err);
    int attempt = (err.requestOptions.extra['retries'] ?? 0) as int;

    if (shouldRetry && attempt < retries) {
      err.requestOptions.extra['retries'] = attempt + 1;

      await Future.delayed(retryDelay);

      try {
        final response = await dio.request(
          err.requestOptions.path,
          data: err.requestOptions.data,
          queryParameters: err.requestOptions.queryParameters,
          options: Options(
            method: err.requestOptions.method,
            headers: err.requestOptions.headers,
            extra: err.requestOptions.extra,
            responseType: err.requestOptions.responseType,
            contentType: err.requestOptions.contentType,
            followRedirects: err.requestOptions.followRedirects,
            validateStatus: err.requestOptions.validateStatus,
            receiveDataWhenStatusError:
                err.requestOptions.receiveDataWhenStatusError,
          ),
        );
        return handler.resolve(response);
      } catch (e) {
        return handler.next(err); // حاول وفشل
      }
    }

    return handler.next(err);
  }

  bool _shouldRetry(DioException err) {
    return err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.receiveTimeout ||
        err.type == DioExceptionType.sendTimeout ||
        err.type == DioExceptionType.unknown;
  }
}

class CustomLogInterceptor extends LogInterceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print('--> ${options.method} ${options.uri}');
    options.headers.forEach((key, value) {
      print('$key: $value');
    });
    if (options.data != null) {
      print('Request body: ${options.data}');
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print('<-- ${response.statusCode} ${response.requestOptions.uri}');
    print('Response: ${response.data}');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    print('⚠️ Error: ${err.message}');
    super.onError(err, handler);
  }
}
