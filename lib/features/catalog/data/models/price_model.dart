import 'package:gulf_catalog_app/features/catalog/domain/entities/price.dart';

class PriceModel extends Price {
  const PriceModel({
    required super.price,
    required super.quantity,
    required super.discount,
    required super.updatedAt,
    required super.expirationDate,
  });

  factory PriceModel.fromJson(Map<String, dynamic> json) {
    return PriceModel(
        price: json['price'],
        quantity: json['quantity'],
        discount: json['discount'],
        expirationDate: json['expiration_date'] != null
            ? DateTime.parse(json['expiration_date'])
            : null,
        updatedAt: json['updated_at'] != null
            ? DateTime.parse(json['updated_at'])
            : null);
  }
}
