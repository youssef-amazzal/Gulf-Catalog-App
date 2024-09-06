import 'package:gulf_catalog_app/features/catalog/domain/entities/brand.dart';

class BrandModel extends Brand {
  const BrandModel({
    required super.id,
    required super.name,
    required super.logo,
    required super.updatedAt,
  });

  factory BrandModel.fromJson(Map<String, dynamic> json) {
    return BrandModel(
        id: json['id'] ?? -1,
        name: json['name'],
        logo: json['logo'],
        updatedAt: json['updated_at'] != null
            ? DateTime.parse(json['updated_at'])
            : null);
  }
}
