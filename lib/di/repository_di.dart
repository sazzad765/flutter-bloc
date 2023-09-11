import 'package:bloc_example/injection_service.dart';
import 'package:bloc_example/view/products/repo/product_repository.dart';
import 'package:bloc_example/view/products/repo/product_repository_impl.dart';

Future<void> setupRepositoryModule() async {
  di.registerLazySingleton<ProductRepository>(
      () => ProductRepositoryImpl(client: di()));
}
