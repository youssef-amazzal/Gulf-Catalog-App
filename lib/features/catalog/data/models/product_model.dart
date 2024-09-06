import 'package:collection/collection.dart';
import 'package:gulf_catalog_app/features/catalog/data/models/brand_model.dart';
import 'package:gulf_catalog_app/features/catalog/data/models/category_model.dart';
import 'package:gulf_catalog_app/features/catalog/data/models/cross_ref_model.dart';
import 'package:gulf_catalog_app/features/catalog/data/models/image_model.dart';
import 'package:gulf_catalog_app/features/catalog/data/models/oe_ref_model.dart';
import 'package:gulf_catalog_app/features/catalog/data/models/price_model.dart';
import 'package:gulf_catalog_app/features/catalog/data/models/vehicle_model.dart';
import 'package:gulf_catalog_app/features/catalog/domain/entities/product_entity.dart';

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
    required super.details,
    required super.images,
    required super.oeRefs,
    required super.vehicles,
    required super.crossRefs,
    required super.updatedAt,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    final prices = _parsePrices(json['prices']);
    final unitPrice = _findUnitPrice(prices);
    final packPrices = _findPackPrices(prices);

    return ProductModel(
      id: json['id'],
      reference: json['ref'],
      brand: BrandModel.fromJson(json['brand']),
      category: CategoryModel.fromJson(json['category']),
      quantity: json['quantity'],
      details: json['details'] ?? {},
      thumbnail: _parseThumbnail(json['thumbnail']),
      images: _parseImages(json['images']),
      unitPrice: unitPrice,
      packPrices: packPrices,
      oeRefs: _parseOeRefs(json['oe_refs']),
      vehicles: _parseVehicles(json['vehicles']),
      crossRefs: _parseCrossRefs(json['cross_refs']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  static List<PriceModel> _parsePrices(dynamic pricesJson) {
    return (pricesJson as List)
        .map((price) => PriceModel.fromJson(price))
        .toList();
  }

  static PriceModel? _findUnitPrice(List<PriceModel> prices) {
    return prices.firstWhereOrNull((price) => price.quantity == 1);
  }

  static List<PriceModel> _findPackPrices(List<PriceModel> prices) {
    return prices.where((price) => price.quantity > 1).toList();
  }

  static ImageModel? _parseThumbnail(dynamic thumbnailJson) {
    return thumbnailJson != null ? ImageModel.fromJson(thumbnailJson) : null;
  }

  static List<ImageModel> _parseImages(dynamic imagesJson) {
    return imagesJson != null
        ? (imagesJson as List).map((e) => ImageModel.fromJson(e)).toList()
        : [];
  }

  static List<OeRefModel> _parseOeRefs(dynamic oeRefsJson) {
    return oeRefsJson != null
        ? (oeRefsJson as List).map((e) => OeRefModel.fromJson(e)).toList()
        : [];
  }

  static List<VehicleModel> _parseVehicles(dynamic vehiclesJson) {
    return vehiclesJson != null
        ? (vehiclesJson as List).map((e) => VehicleModel.fromJson(e)).toList()
        : [];
  }

  static List<CrossRefModel> _parseCrossRefs(dynamic crossRefsJson) {
    return crossRefsJson != null
        ? (crossRefsJson as List).map((e) => CrossRefModel.fromJson(e)).toList()
        : [];
  }
}
