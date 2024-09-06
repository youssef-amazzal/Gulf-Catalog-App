import 'package:gulf_catalog_app/features/catalog/domain/entities/price_entity.dart';
import 'package:gulf_catalog_app/features/catalog/domain/entities/product_entity.dart';
import 'package:collection/collection.dart';
import 'package:gulf_catalog_app/features/catalog/domain/entities/category_entity.dart';

class ProductModel extends Product {
  const ProductModel({
    required super.id,
    required super.reference,
    required super.brand,
    required super.unitPrice,
    required super.packPrices,
    required super.thumbnail,
    required super.quantity,
    required super.category,
    required super.updatedAt,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    final prices = (json['prices'] as List)
        .map((price) => PriceModel.fromJson(price))
        .toList();

    PriceModel? unitPrice =
        prices.firstWhereOrNull((price) => price.quantity == 1);

    List<PriceModel> packPrices =
        prices.where((price) => price.quantity > 1).toList();

    return ProductModel(
      id: json['id'],
      reference: json['ref'],
      category: CategoryEntity(
          id: json['category']['id'], name: json['category']['name']),
      quantity: json['quantity'],
      thumbnail: json['thumbnail']?['url'], // Handle null thumbnail
      unitPrice: unitPrice,
      packPrices: packPrices,
      brand: json['brand']?['name'],
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}

class PriceModel extends Price {
  const PriceModel({
    required super.id,
    required super.price,
    required super.discount,
    required super.quantity,
    required super.expirationDate,
    required super.updatedAt,
  });

  factory PriceModel.fromJson(Map<String, dynamic> json) {
    return PriceModel(
      id: json['id'],
      price: json['price'],
      quantity: json['quantity'],
      discount: json['discount'],
      expirationDate: json['expiration_date'] != null
          ? DateTime.parse(json['expiration_date'])
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : DateTime.now(),
    );
  }
}
