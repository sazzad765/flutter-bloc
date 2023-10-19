import 'package:bloc_example/domain/products/repo/product_repository.dart';
import 'package:bloc_example/service/injection_service.dart';
import 'package:bloc_example/data/product/product_repository_impl.dart';

Future<void> setupRepositoryModule() async {
  di.registerLazySingleton<ProductRepository>(() => ProductRepositoryImpl(
    client: di(),
    sharePref: di(),
  ));
}
