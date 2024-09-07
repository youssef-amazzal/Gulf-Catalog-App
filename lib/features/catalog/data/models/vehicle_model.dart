import 'package:gulf_catalog_app/features/catalog/domain/entities/vehicle.dart';

class VehicleModel extends Vehicle {
  const VehicleModel({
    required num id,
    required String name,
    num? kw,
    num? hp,
    num? capacityCc,
    String? engine,
    String? bodyStyle,
    DateTime? beginYearMonth,
    DateTime? endYearMonth,
    DateTime? updatedAt,
  }) : super(
          id: id,
          name: name,
          kw: kw,
          hp: hp,
          capacityCc: capacityCc,
          engine: engine,
          bodyStyle: bodyStyle,
          beginYearMonth: beginYearMonth,
          endYearMonth: endYearMonth,
          updatedAt: updatedAt,
        );

  factory VehicleModel.fromJson(Map<String, dynamic> json) {
    return VehicleModel(
        id: json['id'],
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
