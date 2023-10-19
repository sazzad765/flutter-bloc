import 'package:bloc_example/service/injection_service.dart';
import 'package:bloc_example/view/products/domain/usecases/get_product_use_case.dart';
import 'package:bloc_example/view/products/domain/usecases/get_products_use_case.dart';

Future<void> setUpUseCaseModule() async {
  di.registerLazySingleton<GetProductsUseCase>(
    () => GetProductsUseCase(repository: di()),
  );
  di.registerLazySingleton<GetProductUseCase>(
    () => GetProductUseCase(repository: di()),
  );
}
