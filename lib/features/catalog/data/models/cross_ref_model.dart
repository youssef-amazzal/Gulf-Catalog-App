import 'package:gulf_catalog_app/features/catalog/data/models/brand_model.dart';
import 'package:gulf_catalog_app/features/catalog/domain/entities/cross_ref.dart';

class CrossRefModel extends CrossRef {
  const CrossRefModel(
      {required super.ref, required super.brand, required super.updatedAt});

  factory CrossRefModel.fromJson(Map<String, dynamic> json) {
    return CrossRefModel(
        ref: json['ref'],
        brand: BrandModel.fromJson(json['brand']),
        updatedAt: json['updated_at'] != null
            ? DateTime.parse(json['updated_at'])
            : null);
  }
}
