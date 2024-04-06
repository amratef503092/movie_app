import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

// import '../helpers/cach_helpers/cach_helpers.dart';
// import '../util/app_strings.dart';
// import '../util/key_manager/key_manager.dart';


class AppInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    debugPrint('REQUEST[${options.method}] => PATH: ${options.path}');
    // options.headers[AppStrings.contentType] = AppStrings.applicationJson;
    // options.headers[AppStrings.authorization] =
    //     CacheHelper.getDataString(key: Keys.token);
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint(
        'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    debugPrint(
        'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
    super.onError(err, handler);
  }
}
