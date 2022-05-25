import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;
  static initialize() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://d67c-196-205-94-85.eu.ngrok.io/api/v1',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response?> getData({
    required String url,
    Map<String, dynamic>? query,
    required String token,
  }) async {
    dio!.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    try {
      return await dio!.get(
        url,
        queryParameters: query,
      );
    } on DioError catch (e) {
      return e.response;
    }
  }

  static Future<Response> postData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
  }) async {
    return await dio!.post(
      url,
      queryParameters: query,
      data: data,
    );
  }
}
