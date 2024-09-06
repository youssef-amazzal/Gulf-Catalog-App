import 'package:equatable/equatable.dart';
import 'package:gulf_catalog_app/features/catalog/domain/entities/price_entity.dart';
import 'package:gulf_catalog_app/features/catalog/domain/entities/category_entity.dart';

class Product extends Equatable {
  final num id;
  final String reference;
  final String brand;
  final CategoryEntity category;
  final num quantity;
  final String? thumbnail;
  final Price? unitPrice;
  final List<Price> packPrices;
  final DateTime updatedAt;

  const Product({
    required this.id,
    required this.reference,
    required this.brand,
    required this.category,
    required this.unitPrice,
    required this.packPrices,
    required this.thumbnail,
    required this.quantity,
    required this.updatedAt,
  });

  @override
  List<Object?> get props {
    return [
      id,
      reference,
      quantity,
      thumbnail,
      unitPrice,
      packPrices,
      updatedAt
    ];
  }
}
