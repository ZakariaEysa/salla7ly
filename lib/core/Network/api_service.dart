import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;

  ApiService({
    required this.dio,
  });

  Future<Response> getWithoutToken(
      {required String endPoint, Map<String, dynamic>? query}) async {
    // dio.interceptors.add(CustomLogInterceptor());
    var response = await dio.get(
      // '${EndPoints.baseUrlNew}$endPoint',
      endPoint,
      queryParameters: query,
      options: Options(
        validateStatus: (status) {
          return status! == 200 ||
              status == 201 ||
              status == 401 ||
              status == 500;
        },
      ),
    );
    return response;
  }

  Future<Response> postWithoutToken({
    required String endPoint,
    dynamic body,
  }) async {
    dio.options.headers = {
      "accept": "*/*",
      "Content-Type": 'application/json',
    };
    // dio.interceptors.add(CustomLogInterceptor());

    var response = await dio.post(
      // '${EndPoints.baseUrlNew}$endPoint',
      endPoint,
      data: body,
      options: Options(
        validateStatus: (status) {
          return status == 200 ||
              status == 201 ||
              status == 202 ||
              status == 400 ||
              status == 409 ||
              status == 500;
        },
      ),
    );
    return response;
  }
}
