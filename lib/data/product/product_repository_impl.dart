import 'package:bloc_example/api/api_client.dart';
import 'package:bloc_example/demo_data/data.dart';
import 'package:bloc_example/models/base_response.dart';
import 'package:bloc_example/models/product.dart';
import 'package:bloc_example/service/base_service.dart';
import 'package:bloc_example/view/products/repo/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  ProductRepositoryImpl({
    required RestClient client,
  }) : _client = client;

  final RestClient _client;

  @override
  Future<BaseResponse<List<Product>>> getProducts() async {
    await Future.delayed(const Duration(seconds: 3));
    var result = BaseResponse<List<Product>>();
    try {
      result = BaseResponse<List<Product>>.fromJson(productsData,
          (p0) => List<Product>.from(p0.map((x) => Product.fromJson(x))));
    } catch (e) {
      result = BaseService.errorResponse(e);
    }

    // final products =
    //     List<Product>.from(productsData.map((x) => Product.fromJson(x)));
    return result;
  }
}
