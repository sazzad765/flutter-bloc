import 'dart:convert';

import 'package:bloc_example/service/injection_service.dart';
import 'package:bloc_example/service/shared_pref.dart';
import 'package:dio/dio.dart';
import 'dart:developer' as logdev;

class CustomInterceptors extends InterceptorsWrapper {
  CustomInterceptors({
    required SharePref sharePref,
  }) : _sharePref = sharePref;

  final SharePref _sharePref;

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    String? token = _sharePref.getToken();
    if (token != null) {
      options.headers.addAll({
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json'
      });
    }

    logdev.log(
        'url: ${options.baseUrl}${options.path} headers: ${options.headers}  Q: ${options.queryParameters} Data: ${options.data}');
    return handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    logdev.log(jsonEncode(err));
    return handler.next(err);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // var newResponse = BaseResponse(
    //     statusCode: response.statusCode ?? 404,
    //     message: response.statusMessage ?? '',
    //     data: response.statusCode == 200 ? response.data : null);
    // response.data = newResponse.toJson();
    logdev.log('${response.realUri}');
    logdev.log(jsonEncode(response.data));
    return handler.next(response);
  }
}
