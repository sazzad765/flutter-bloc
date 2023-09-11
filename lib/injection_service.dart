import 'package:bloc_example/di/network_di.dart';
import 'package:bloc_example/di/repository_di.dart';
import 'package:get_it/get_it.dart';

final GetIt di = GetIt.instance;

Future<void> setup() async {
  await setupNetworkModule();
  await setupRepositoryModule();
}
