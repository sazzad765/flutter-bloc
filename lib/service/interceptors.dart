import 'package:dio/dio.dart';

class CustomInterceptors extends InterceptorsWrapper {
  CustomInterceptors();

  // SharedPref pref;

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    String token = '';
    if (token != '') {
      options.headers.addAll({
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json'
      });
    }
    print(
        'url: ${options.baseUrl}${options.path} headers: ${options.headers}  Q: ${options.queryParameters}  ');
    print('Data: ${options.data}');
    return handler.next(options);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    print(err);
    return handler.next(err);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // var newResponse = BaseResponse(
    //     statusCode: response.statusCode ?? 404,
    //     message: response.statusMessage ?? '',
    //     data: response.statusCode == 200 ? response.data : null);
    // response.data = newResponse.toJson();
    print(response);
    return handler.next(response);
  }
}
