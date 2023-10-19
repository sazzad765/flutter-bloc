import 'package:bloc_example/domain/products/repo/product_repository.dart';
import 'package:bloc_example/models/base_response.dart';
import 'package:bloc_example/models/product.dart';
import 'package:bloc_example/service/base_service.dart';

class GetProductsUseCase {
  GetProductsUseCase({required ProductRepository repository})
      : _repository = repository;

  final ProductRepository _repository;

  Future<BaseResponse<List<Product>>> call() async {
    return _repository.getProducts().then((value) => value).onError(
            (error, stackTrace) => BaseService.errorResponse(error: error));
  }
}
