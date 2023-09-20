import 'package:bloc_example/data/theme/theme_repository_impl.dart';
import 'package:bloc_example/injection_service.dart';
import 'package:bloc_example/view/products/repo/product_repository.dart';
import 'package:bloc_example/data/product/product_repository_impl.dart';
import 'package:bloc_example/view/theme/repo/theme_repository.dart';

Future<void> setupRepositoryModule() async {
  di.registerLazySingleton<ProductRepository>(
      () => ProductRepositoryImpl(client: di()));
  di.registerLazySingleton<ThemeRepository>(() => ThemeRepositoryImpl());
}
