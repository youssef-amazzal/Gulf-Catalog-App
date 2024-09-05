import 'package:equatable/equatable.dart';
import 'package:gulf_catalog_app/features/category/domain/entities/category_entity.dart';

class Product extends Equatable {
  final int? id;
  final String? reference;
  final String? brand;
  final CategoryEntity? category;
  final int? quantity;
  final String? thumbnail;
  final List<PriceEntity>? prices;
  final DateTime? updatedAt;

  const Product({
    required this.id,
    required this.reference,
    required this.brand,
    required this.category,
    required this.prices,
    required this.thumbnail,
    required this.quantity,
    required this.updatedAt,
  });

  @override
  List<Object?> get props {
    return [id, reference, quantity, thumbnail, prices, updatedAt];
  }
}

class PriceEntity extends Equatable {
  final int id;
  final double price;
  final int quantity;
  final double? discount;
  final DateTime? expirationDate;
  final DateTime? updatedAt;

  const PriceEntity({
    required this.id,
    required this.price,
    required this.discount,
    required this.quantity,
    required this.expirationDate,
    required this.updatedAt,
  });

  @override
  List<Object?> get props {
    return [price, discount, quantity, expirationDate, updatedAt];
  }
}
