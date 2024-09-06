import 'package:gulf_catalog_app/features/catalog/data/models/manufacturer_model.dart';
import 'package:gulf_catalog_app/features/catalog/domain/entities/oe_ref.dart';

class OeRefModel extends OeRef {
  const OeRefModel(
      {required super.ref, required super.mfr, required super.updatedAt});

  factory OeRefModel.fromJson(Map<String, dynamic> json) {
    return OeRefModel(
        ref: json['ref'],
        mfr: ManufacturerModel.fromJson(json['mfr']),
        updatedAt: json['updated_at'] != null
            ? DateTime.parse(json['updated_at'])
            : null);
  }
}
