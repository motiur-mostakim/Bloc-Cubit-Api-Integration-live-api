// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dimensions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DimensionsModel _$DimensionsModelFromJson(Map<String, dynamic> json) =>
    DimensionsModel(
      depth: (json['depth'] as num?)?.toDouble(),
      height: (json['height'] as num?)?.toDouble(),
      weight: (json['weight'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$DimensionsModelToJson(DimensionsModel instance) =>
    <String, dynamic>{
      'weight': instance.weight,
      'height': instance.height,
      'depth': instance.depth,
    };
