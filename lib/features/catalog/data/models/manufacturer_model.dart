import 'package:gulf_catalog_app/features/catalog/domain/entities/manufacturer.dart';

class ManufacturerModel extends Manufacturer {
  const ManufacturerModel({
    required super.id,
    required super.name,
    required super.updatedAt,
    required super.logo,
  });

  factory ManufacturerModel.fromJson(Map<String, dynamic> json) {
    return ManufacturerModel(
        id: json['id'],
        name: json['name'],
        logo: json['logo'],
        updatedAt: json['updated_at'] != null
            ? DateTime.parse(json['updated_at'])
            : null);
  }
}
