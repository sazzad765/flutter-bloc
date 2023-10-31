class Product {
  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;
  Rating? rating;

  Product({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rating,
  });

  Product copyWith({
    int? id,
    String? title,
    double? price,
    String? description,
    String? category,
    String? image,
    Rating? rating,
  }) =>
      Product(
        id: id ?? this.id,
        title: title ?? this.title,
        price: price ?? this.price,
        description: description ?? this.description,
        category: category ?? this.category,
        image: image ?? this.image,
        rating: rating ?? this.rating,
      );

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        title: json["title"],
        price: json["price"]?.toDouble(),
        description: json["description"],
        category: json["category"],
        image: json["image"],
        rating: json["rating"] == null ? null : Rating.fromJson(json["rating"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "description": description,
        "category": category,
        "image": image,
        "rating": rating?.toJson(),
      };
}

class Rating {
  double? rate;
  int? count;

  Rating({
    this.rate,
    this.count,
  });

  Rating copyWith({
    double? rate,
    int? count,
  }) =>
      Rating(
        rate: rate ?? this.rate,
        count: count ?? this.count,
      );

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        rate: json["rate"]?.toDouble(),
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "rate": rate,
        "count": count,
      };
}

// import 'package:flutter/foundation.dart';
//
// part 'product.freezed.dart';
//
// part 'product.g.dart';
//
// @freezed
// class Product with _$Product {
//   const factory Product({
//     @JsonKey(name: "id") int? id,
//     @JsonKey(name: "title") String? title,
//     @JsonKey(name: "description") String? description,
//     @JsonKey(name: "price") int? price,
//     @JsonKey(name: "discountPercentage") double? discountPercentage,
//     @JsonKey(name: "rating") double? rating,
//     @JsonKey(name: "stock") int? stock,
//     @JsonKey(name: "brand") String? brand,
//     @JsonKey(name: "category") String? category,
//     @JsonKey(name: "thumbnail") String? thumbnail,
//     @JsonKey(name: "images") List<String>? images,
//   }) = _Product;
//
//   factory Product.fromJson(Map<String, dynamic> json) =>
//       _$ProductFromJson(json);
// }
