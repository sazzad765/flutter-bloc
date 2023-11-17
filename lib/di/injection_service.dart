import 'package:bloc_example/di/service_di.dart';
import 'package:bloc_example/di/repository_di.dart';
import 'package:bloc_example/di/use_case_di.dart';
import 'package:get_it/get_it.dart';

final GetIt di = GetIt.instance;

Future<void> setup() async {
  await setupServiceModule();
  await setupRepositoryModule();
  await setUpUseCaseModule();
}
