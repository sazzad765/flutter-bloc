import 'package:bloc_example/models/base_response.dart';
import 'package:dio/dio.dart';

class BaseService {
  static BaseResponse<T> errorResponse<T>(
      {Object? error, StackTrace? stackTrace}) {
    print(error);
    print(stackTrace);

    switch (error.runtimeType) {
      case DioException:
        final res = (error as DioException).response;
        var message = res?.data['message'];
        var newResponse = BaseResponse<T>(
          statusCode: res?.statusCode ?? 404,
          message: message ?? res?.statusMessage ?? '',
        );
        return newResponse;

      default:
        return BaseResponse<T>(message: 'Something wrong!', statusCode: 404);
    }
  }
}
