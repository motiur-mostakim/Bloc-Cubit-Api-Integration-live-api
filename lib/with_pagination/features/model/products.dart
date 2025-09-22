// import 'package:json_annotation/json_annotation.dart';
//
// import 'dimensions.dart';
//
// part 'products.g.dart';
//
// @JsonSerializable(explicitToJson: true)
// class Products {
//   final int? id;
//   final double? price;
//   final double? rating;
//   final int? stock;
//   final int? weight;
//   final List<String>? tags;
//   final DimensionsModel? dimensions;
//   final double? discountPercentage;
//   final String? title;
//   final String? description;
//   final String? category;
//   final String? brand;
//   final String? sku;
//   final String? warrantyInformation;
//   final String? shippingInformation;
//   final String? availabilityStatus;
//   final String? returnPolicy;
//   final String? thumbnail;
//   final int? minimumOrderQuantity;
//
//   Products({
//     this.availabilityStatus,
//     this.brand,
//     this.category,
//     this.description,
//     this.dimensions,
//     this.discountPercentage,
//     this.id,
//     this.minimumOrderQuantity,
//     this.price,
//     this.rating,
//     this.returnPolicy,
//     this.shippingInformation,
//     this.sku,
//     this.stock,
//     this.tags,
//     this.thumbnail,
//     this.title,
//     this.warrantyInformation,
//     this.weight,
//   });
//
//   factory Products.fromJson(Map<String, dynamic> json) =>
//       _$ProductsFromJson(json);
//
//   Map<String, dynamic> toJson() => _$ProductsToJson(this);
// }
