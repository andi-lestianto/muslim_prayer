import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:muslim_prayer/app/utils/endpoint_utils.dart';

class DioServices {
  late Dio dio = Dio()
    ..options.headers = {'Content-Type': 'application/json'}
    ..options.baseUrl = EndpointUtils.baseUrl
    ..options.connectTimeout = const Duration(seconds: 15)
    ..options.sendTimeout = const Duration(seconds: 15)
    ..options.responseType = ResponseType.json
    ..interceptors.add(InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
      return handler.next(options);
    }, onResponse: (Response response, ResponseInterceptorHandler handler) {
      log(response.toString(), name: 'API Response');
      return handler.next(response);
    }, onError: (DioException e, ErrorInterceptorHandler handler) {
      return handler.next(e);
    }));
}
