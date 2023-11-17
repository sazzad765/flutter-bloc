import 'package:bloc_example/core/products/repository/product_repository.dart';
import 'package:bloc_example/data/product/product_repository_impl.dart';
import 'package:bloc_example/di/injection_service.dart';

Future<void> setupRepositoryModule() async {
  di.registerLazySingleton<ProductRepository>(() => ProductRepositoryImpl(
        client: di(),
        sharePref: di(),
      ));
}
