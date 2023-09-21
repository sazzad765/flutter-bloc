import 'package:bloc_example/api/api_client.dart';
import 'package:bloc_example/demo_data/data.dart';
import 'package:bloc_example/models/product.dart';
import 'package:bloc_example/view/products/repo/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  ProductRepositoryImpl({
    required RestClient client,
  }) : _client = client;

  final RestClient _client;

  @override
  Future<List<Product>> getProducts() async {
    await Future.delayed(const Duration(seconds: 3));
    final products =
        List<Product>.from(productsData.map((x) => Product.fromJson(x)));
    return products;
  }
}
