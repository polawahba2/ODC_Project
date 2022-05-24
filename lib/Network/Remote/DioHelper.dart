import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;
  static initialize() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://5742-196-205-94-85.eu.ngrok.io/api/v1',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String token = '',
  }) async {
    dio!.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': token,
    };
    return await dio!.get(
      url,
      queryParameters: query,
    );
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
