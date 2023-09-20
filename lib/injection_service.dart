import 'package:bloc_example/di/api_client_di.dart';
import 'package:bloc_example/di/repository_di.dart';
import 'package:get_it/get_it.dart';

final GetIt di = GetIt.instance;

Future<void> setup() async {
  await setupApiModule();
  await setupRepositoryModule();
}
