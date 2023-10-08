import 'package:bloc_example/models/filter_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'product.freezed.dart';

part 'product.g.dart';

@freezed
class Product with _$Product {
  const factory Product({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "title") String? title,
    @JsonKey(name: "description") String? description,
    @JsonKey(name: "price") int? price,
    @JsonKey(name: "discountPercentage") double? discountPercentage,
    @JsonKey(name: "rating") double? rating,
    @JsonKey(name: "stock") int? stock,
    @JsonKey(name: "brand") String? brand,
    @JsonKey(name: "category") String? category,
    @JsonKey(name: "thumbnail") String? thumbnail,
    @JsonKey(name: "images") List<String>? images,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}
