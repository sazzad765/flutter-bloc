import 'package:bloc_example/api/api_client.dart';
import 'package:bloc_example/demo_data/data.dart';
import 'package:bloc_example/models/base_response.dart';
import 'package:bloc_example/models/product/product.dart';
import 'package:bloc_example/core/products/repository/product_repository.dart';
import 'package:bloc_example/common/service/shared_pref.dart';

class ProductRepositoryImpl implements ProductRepository {
  ProductRepositoryImpl({
    required RestClient client,
    required SharePref sharePref,
  })  : _client = client,
        _sharePref = sharePref;

  final RestClient _client;
  final SharePref _sharePref;

  // @override
  // Future<BaseResponse<List<Product>>> getProducts() async {
  //   await Future.delayed(const Duration(seconds: 3));
  //   var result = BaseResponse<List<Product>>();
  //   try {
  //     result = BaseResponse<List<Product>>.fromJson(productsData,
  //         (p0) => List<Product>.from(p0.map((x) => Product.fromJson(x))));
  //   } catch (e) {
  //     result = BaseService.errorResponse(e);
  //   }
  //
  //   // final products =
  //   //     List<Product>.from(productsData.map((x) => Product.fromJson(x)));
  //   return result;
  // }

  @override
  Future<BaseResponse<List<Product>>> getProducts() async {
    // await Future.delayed(const Duration(seconds: 3));
    // return BaseResponse<List<Product>>.fromJson(productsData,
    //     (p0) => List<Product>.from(p0.map((x) => Product.fromJson(x))));
    return await _client.getProducts();
  }

  @override
  Future<BaseResponse<Product>> getProduct({required int id}) async {
    return await _client.getProductById('$id');
    // await Future.delayed(const Duration(seconds: 3));
    //
    // final list = productsData["data"] as List;
    // final item = list.firstWhere((element) => element['id'] == id);
    // return BaseResponse<Product>.fromJson(item, (p0) => Product.fromJson(p0));
  }
}
