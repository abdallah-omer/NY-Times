import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:ny_times/utilities/di.dart';
import 'package:ny_times/utilities/api/api_consumer.dart';
import 'package:ny_times/utilities/api/api_interceptors.dart';
import 'package:ny_times/utilities/api/end_points.dart';
import 'package:ny_times/utilities/api/status_code.dart';

class DioConsumer extends ApiConsumer {
  final Dio dio;

  DioConsumer({required this.dio}) {
    dio.httpClientAdapter = IOHttpClientAdapter(
      createHttpClient: () {
        final client = HttpClient();
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
        return client;
      },
    );
    dio.options
      ..baseUrl = EndPoints.baseUrl
      ..responseType = ResponseType.plain
      ..followRedirects = false
      ..validateStatus = (status) => status! < StatusCode.internalServerError;
    dio.interceptors.add(AppInterceptors());
  }

  @override
  Future get(String relativeURL,
      {Map<String, dynamic>? queryParameters}) async {
    final response =
        await dio.get(relativeURL, queryParameters: queryParameters);
    final responseJson = jsonDecode(response.data.toString());
    return responseJson;
  }
}
