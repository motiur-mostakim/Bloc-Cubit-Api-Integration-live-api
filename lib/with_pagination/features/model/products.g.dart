// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Products _$ProductsFromJson(Map<String, dynamic> json) => Products(
      availabilityStatus: json['availabilityStatus'] as String?,
      brand: json['brand'] as String?,
      category: json['category'] as String?,
      description: json['description'] as String?,
      dimensions: json['dimensions'] == null
          ? null
          : DimensionsModel.fromJson(
              json['dimensions'] as Map<String, dynamic>),
      discountPercentage: (json['discountPercentage'] as num?)?.toDouble(),
      id: (json['id'] as num?)?.toInt(),
      minimumOrderQuantity: (json['minimumOrderQuantity'] as num?)?.toInt(),
      price: (json['price'] as num?)?.toDouble(),
      rating: (json['rating'] as num?)?.toDouble(),
      returnPolicy: json['returnPolicy'] as String?,
      shippingInformation: json['shippingInformation'] as String?,
      sku: json['sku'] as String?,
      stock: (json['stock'] as num?)?.toInt(),
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      thumbnail: json['thumbnail'] as String?,
      title: json['title'] as String?,
      warrantyInformation: json['warrantyInformation'] as String?,
      weight: (json['weight'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ProductsToJson(Products instance) => <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'rating': instance.rating,
      'stock': instance.stock,
      'weight': instance.weight,
      'tags': instance.tags,
      'dimensions': instance.dimensions?.toJson(),
      'discountPercentage': instance.discountPercentage,
      'title': instance.title,
      'description': instance.description,
      'category': instance.category,
      'brand': instance.brand,
      'sku': instance.sku,
      'warrantyInformation': instance.warrantyInformation,
      'shippingInformation': instance.shippingInformation,
      'availabilityStatus': instance.availabilityStatus,
      'returnPolicy': instance.returnPolicy,
      'thumbnail': instance.thumbnail,
      'minimumOrderQuantity': instance.minimumOrderQuantity,
    };
