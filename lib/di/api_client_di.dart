import 'package:bloc_example/api/api_client.dart';
import 'package:bloc_example/injection_service.dart';
import 'package:bloc_example/service/interceptors.dart';
import 'package:bloc_example/utils/const_string.dart';
import 'package:dio/dio.dart';

Future<void> setupApiModule() async {
  di.registerLazySingleton<RestClient>(() => RestClient(Dio(BaseOptions(
      contentType: "application/json", baseUrl: ConstString.baseUrl))
    ..interceptors.add(CustomInterceptors())));
}
