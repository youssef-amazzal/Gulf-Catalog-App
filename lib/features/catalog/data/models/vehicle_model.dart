import 'package:gulf_catalog_app/features/catalog/domain/entities/vehicle.dart';

class VehicleModel extends Vehicle {
  const VehicleModel({
    required super.name,
    required super.kw,
    required super.hp,
    required super.capacityCc,
    required super.engine,
    required super.bodyStyle,
    required super.beginYearMonth,
    required super.endYearMonth,
    required super.updatedAt,
  });

  factory VehicleModel.fromJson(Map<String, dynamic> json) {
    return VehicleModel(
        name: json['name'],
        kw: json['kw'],
        hp: json['hp'],
        capacityCc: json['capacity_cc'],
        engine: json['engine'],
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
