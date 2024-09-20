import 'package:equatable/equatable.dart';
import 'package:gulf_catalog_app/features/catalog/domain/entities/brand.dart';
import 'package:gulf_catalog_app/features/catalog/domain/entities/category.dart';
import 'package:gulf_catalog_app/features/catalog/domain/entities/cross_ref.dart';
import 'package:gulf_catalog_app/features/catalog/domain/entities/image.dart';
import 'package:gulf_catalog_app/features/catalog/domain/entities/oe_ref.dart';
import 'package:gulf_catalog_app/features/catalog/domain/entities/price.dart';
import 'package:gulf_catalog_app/features/catalog/domain/entities/section.dart';
import 'package:gulf_catalog_app/features/catalog/domain/entities/vehicle.dart';

class Product extends Equatable {
  final num id;
  final num? quantity;
  final String? reference;
  final List<Section>? details;
  final bool isLowRotated;

  final Brand? brand;
  final Category? category;

  final Price? unitPrice;
  final List<Price> packPrices;

  final Image? thumbnail;
  final List<Image> images;

  final List<OeRef> oeRefs;
  final List<Vehicle> vehicles;
  final List<CrossRef> crossRefs;

  final DateTime? updatedAt;

  const Product({
    required this.id,
    required this.reference,
    required this.brand,
    required this.category,
    required this.quantity,
    required this.details,
    required this.isLowRotated,
    required this.thumbnail,
    required this.images,
    required this.unitPrice,
    required this.packPrices,
    required this.updatedAt,
    required this.oeRefs,
    required this.vehicles,
    required this.crossRefs,
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
      brand,
      category,
      isLowRotated,
      details,
      images,
      oeRefs,
      vehicles,
      crossRefs,
      updatedAt
    ];
  }
}
