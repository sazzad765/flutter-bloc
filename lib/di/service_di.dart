import 'package:bloc_example/common/network/api_client.dart';
import 'package:bloc_example/common/network/dio_client.dart';
import 'package:bloc_example/data/shared_pref/shared_pref_impl.dart';
import 'package:bloc_example/di/injection_service.dart';
import 'package:bloc_example/common/service/interceptors.dart';
import 'package:bloc_example/common/service/shared_pref.dart';
import 'package:bloc_example/common/utils/const_string.dart';
import 'package:dio/dio.dart';

Future<void> setupServiceModule() async {
  di.registerLazySingleton<SharePref>(() => SharePrefImpl());

  di.registerLazySingleton<RestClient>(
    () => RestClient(
      Dio(
        BaseOptions(
          contentType: "application/json",
          baseUrl: ConstString.baseUrl,
        ),
      )..interceptors.add(
          CustomInterceptors(
            sharePref: di(),
          ),
        ),
    ),
  );

  di.registerLazySingleton<DioClient>(
    () => DioClient(
      Dio(
        BaseOptions(
          contentType: "application/json",
          baseUrl: ConstString.baseUrl,
        ),
      )..interceptors.add(
          CustomInterceptors(
            sharePref: di(),
          ),
        ),
    ),
  );
}
