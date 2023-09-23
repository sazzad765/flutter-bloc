import 'package:bloc_example/models/base_response.dart';
import 'package:bloc_example/models/product.dart';

abstract class ProductRepository {
  Future<BaseResponse<List<Product>>> getProducts();

// Future<dynamic> getConference({required String id});
}
