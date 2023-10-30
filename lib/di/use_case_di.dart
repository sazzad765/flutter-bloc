import 'package:bloc_example/presentation/products/use_case/get_product_use_case.dart';
import 'package:bloc_example/presentation/products/use_case/get_products_use_case.dart';
import 'package:bloc_example/di/injection_service.dart';

Future<void> setUpUseCaseModule() async {
  di.registerLazySingleton<GetProductsUseCase>(
    () => GetProductsUseCase(repository: di()),
  );
  di.registerLazySingleton<GetProductUseCase>(
    () => GetProductUseCase(repository: di()),
  );
}
