import 'package:bloc_example/common/service/base_service.dart';
import 'package:bloc_example/common/service/error_handler.dart';
import 'package:bloc_example/models/base_response.dart';
import 'package:bloc_example/models/product/product.dart';
import 'package:bloc_example/core/products/repository/product_repository.dart';

class GetProductsUseCase {
  GetProductsUseCase({required ProductRepository repository})
      : _repository = repository;

  final ProductRepository _repository;

  Future<BaseResponse<List<Product>>> call() async {
    return _repository
        .getProducts()
        .then((value) => value)
        .onError((error, stackTrace) => ErrorHandler.error(
              error: error,
              stackTrace: stackTrace,
            ));
  }
}
