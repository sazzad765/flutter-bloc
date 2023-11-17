import 'package:bloc_example/models/base_response.dart';
import 'package:bloc_example/models/product/product.dart';
import 'package:dio/dio.dart';

import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @POST("api/login")
  Future<dynamic> login(@Body() Map<String, dynamic> map);

  @GET("products")
  Future<BaseResponse<List<Product>>> getProducts();

  @GET("products/{id}")
  Future<BaseResponse<Product>> getProductById(@Path('id') String id);
}
