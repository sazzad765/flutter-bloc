import 'package:bloc_example/core/products/use_case/get_product_use_case.dart';
import 'package:bloc_example/core/products/use_case/get_products_use_case.dart';
import 'package:bloc_example/di/injection_service.dart';

Future<void> setUpUseCaseModule() async {
  di.registerLazySingleton<GetProductUseCase>(
    () => GetProductUseCase(repository: di()),
  );
  di.registerLazySingleton<GetProductsUseCase>(
    () => GetProductsUseCase(repository: di()),
  );
}
