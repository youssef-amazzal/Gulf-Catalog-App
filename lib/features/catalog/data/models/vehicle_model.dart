import 'package:gulf_catalog_app/features/catalog/domain/entities/vehicle.dart';

class VehicleModel extends Vehicle {
  const VehicleModel({
    required super.id,
    required super.name,
    super.kw,
    super.hp,
    super.capacityCc,
    super.engine,
    super.bodyStyle,
    super.beginYearMonth,
    super.endYearMonth,
    super.updatedAt,
  });

  factory VehicleModel.fromJson(Map<String, dynamic> json) {
    return VehicleModel(
        id: json['id'],
        name: json['name'],
        kw: json['kw'],
        hp: json['hp'],
        capacityCc: json['capacity_cc'],
        engine: json['engine'] != null && json['engine'] != ''
            ? json['engine']
            : null,
        bodyStyle: json['body_style'],
        beginYearMonth: json['begin_year_month'] != null
            ? DateTime.parse(json['begin_year_month'])
            : null,
        endYearMonth: json['end_year_month'] != null
            ? DateTime.parse(json['end_year_month'])
            : null,
        updatedAt: json['updated_at'] != null
            ? DateTime.parse(json['updated_at'])
            : null);
  }
}
