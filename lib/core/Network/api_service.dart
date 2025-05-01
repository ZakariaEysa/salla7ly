import 'dart:async';
import 'package:dio/dio.dart';
import 'custom_interceptor.dart';
import 'end_points.dart';

class ApiService {
  final Dio dio;

  ApiService({required this.dio}) {
    dio.options = BaseOptions(
      baseUrl: EndPoints.baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 15),
      responseType: ResponseType.json,
    );

    dio.interceptors.addAll([
      CustomRetryInterceptor(dio: dio),
      CustomLogInterceptor(),
    ]);
  }

  Map<String, String> _getHeaders({String? token}) {
    return {
      'accept': '*/*',
      'Content-Type': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
    };
  }

  bool _validateStatus(int? status) => true;

  // Error handling method
  Future<dynamic> handleDioError(DioException e) async {
    if (e.type == DioExceptionType.connectionError ||
        e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout ||
        e.type == DioExceptionType.unknown) {
      // Return an empty string and the internet error message.
      return 'مشكلة في الاتصال بالإنترنت';
    } else {
      // For other types of DioException, return the error message.
      return e.response?.data["errors"][1];
    }
  }

  // Function to handle response status and error handling
  Future<Response> handleResponse(Response response) async {
    if (response.statusCode != 200 && response.statusCode != 201) {
      // If the status code is not 200 or 201, we throw a custom DioException
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
        type: DioExceptionType.sendTimeout,
        error: 'خطأ في الاستجابة: ${response.statusCode}',
      );
    }
    return response;
  }

  Future<Response> getWithToken({
    required String endPoint,
    required String token,
    Map<String, dynamic>? query,
  }) async {
    try {
      final response = await dio.get(
        endPoint,
        queryParameters: query,
        options: Options(
          headers: _getHeaders(token: token),
          validateStatus: _validateStatus,
        ),
      );

      // Check response status code
      return await handleResponse(response);
    } on DioException catch (e) {
      var errorDetails =
          await handleDioError(e); // Handle error for internet issues
      return Response(
        requestOptions: e.requestOptions,
        data: errorDetails,
      );
    }
  }

  Future<Response> getWithoutToken({
    required String endPoint,
    Map<String, dynamic>? query,
  }) async {
    try {
      final response = await dio.get(
        endPoint,
        queryParameters: query,
        options: Options(
          headers: _getHeaders(),
          validateStatus: _validateStatus,
        ),
      );

      // Check response status code
      return await handleResponse(response);
    } on DioException catch (e) {
      var errorDetails =
          await handleDioError(e); // Handle error for internet issues
      return Response(
        requestOptions: e.requestOptions,
        data: errorDetails,
      );
    }
  }

  Future<Response> postWithToken({
    required String endPoint,
    dynamic body,
    required String token,
  }) async {
    try {
      final response = await dio.post(
        endPoint,
        data: body,
        options: Options(
          headers: _getHeaders(token: token),
          validateStatus: _validateStatus,
        ),
      );

      // Check response status code
      return await handleResponse(response);
    } on DioException catch (e) {
      var errorDetails =
          await handleDioError(e); // Handle error for internet issues
      return Response(
        requestOptions: e.requestOptions,
        data: errorDetails,
      );
    }
  }

  Future<Response> postWithoutToken({
    required String endPoint,
    dynamic body,
  }) async {
    try {
      final response = await dio.post(
        endPoint,
        data: body,
        options: Options(
          headers: _getHeaders(),
          validateStatus: _validateStatus,
        ),
      );

      // Check response status code
      return await handleResponse(response);
    } on DioException catch (e) {
      var errorDetails =
          await handleDioError(e); // Handle error for internet issues
      return Response(
        requestOptions: e.requestOptions,
        data: errorDetails,
      );
    }
  }

  // Additional methods (PUT, DELETE, etc.) can follow the same structure
}
