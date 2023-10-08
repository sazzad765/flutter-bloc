import 'package:bloc_example/api/api_client.dart';
import 'package:bloc_example/models/base_response.dart';
import 'package:dio/dio.dart';

class BaseService {
  static BaseResponse<T> errorResponse<T>(Object obj) {
    switch (obj.runtimeType) {
      case DioException:
        final res = (obj as DioException).response;
        var message = res?.data['message'];
        var newResponse = BaseResponse<T>(
          statusCode: res?.statusCode ?? 404,
          message: message ?? res?.statusMessage ?? '',
        );
        return newResponse;
      default:
        return BaseResponse<T>(message: 'Error', statusCode: 404);
    }
  }

// List<T> search<T extends FilterModel>({
//   required List<T> items,
//   required String q,
//   SearchFilter<T>? filter,
// }) {
//   final i = items.where((item) => filter == null || filter(item)).toList();
//   return i.where((element) => element.matcher(q)).toList();
// }
}

// typedef SearchFilter<T> = bool Function(T item);
