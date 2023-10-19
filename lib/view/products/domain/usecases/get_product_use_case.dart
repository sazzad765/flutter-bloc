import 'package:bloc_example/models/base_response.dart';
import 'package:bloc_example/models/product.dart';
import 'package:bloc_example/service/base_service.dart';
import 'package:bloc_example/view/products/domain/repo/product_repository.dart';

class GetProductUseCase {
  GetProductUseCase({required ProductRepository repository})
      : _repository = repository;

  final ProductRepository _repository;

  Future<BaseResponse<Product>> call({required int id}) async {
    return _repository.getProduct(id: id).then((value) => value).onError(
        (error, stackTrace) => BaseService.errorResponse(error: error));
  }
}
