import 'package:gulf_catalog_app/features/catalog/domain/entities/category.dart';

class CategoryModel extends Category {
  const CategoryModel(
      {required super.id, required super.name, required super.updatedAt});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'] ?? -1,
      name: json['name'],
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : null,
    );
  }
}
