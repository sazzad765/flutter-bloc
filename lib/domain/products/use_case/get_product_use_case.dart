import 'package:bloc_example/domain/products/repo/product_repository.dart';
import 'package:bloc_example/models/base_response.dart';
import 'package:bloc_example/models/product.dart';
import 'package:bloc_example/service/base_service.dart';

class GetProductUseCase {
  GetProductUseCase({required ProductRepository repository})
      : _repository = repository;

  final ProductRepository _repository;

  Future<BaseResponse<Product>> call({required int id}) async {
    return _repository.getProduct(id: id).then((value) => value).onError(
            (error, stackTrace) => BaseService.errorResponse(error: error));
  }
}
