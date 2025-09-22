import 'package:json_annotation/json_annotation.dart';

import 'dimensions.dart';

part 'categories.g.dart';

@JsonSerializable(explicitToJson: true)
class Categories {
  final String? slug;
  final String? name;
  final String? url;

  Categories({
    this.slug,
    this.name,
    this.url,
  });

  factory Categories.fromJson(Map<String, dynamic> json) =>
      _$CategoriesFromJson(json);

  Map<String, dynamic> toJson() => _$CategoriesToJson(this);
}
