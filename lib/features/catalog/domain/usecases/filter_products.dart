import 'package:fpdart/fpdart.dart';
import 'package:gulf_catalog_app/core/error/failure.dart';
import 'package:gulf_catalog_app/core/usecase/usecase.dart';
import 'package:gulf_catalog_app/features/catalog/domain/entities/product.dart';
import 'package:gulf_catalog_app/features/catalog/presentation/bloc/catalog/catalog_bloc.dart';

class FilterProducts implements Usecase<List<Product>, FilterParams> {
  @override
  Future<Either<Failure, List<Product>>> call(FilterParams params) async {
    try {
      List<Product> products = List.from(params.products);

      products = _filterByAvailability(products, params.availability);
      products = _filterByCategory(products, params.category);
      products = _sortBy(products, params.sortBy);
      products = _filterByLowRotation(products, params.isLowRotated);

      return right(products);
    } catch (error) {
      return Left(Failure(error.toString()));
    }
  }

  List<Product> _filterByCategory(List<Product> products, String? category) {
    if (category == null) return products;
    return products.where((p) => p.category!.name == category).toList();
  }

  List<Product> _filterByAvailability(
      List<Product> products, Availability avaialability) {
    switch (avaialability) {
      case Availability.inStock:
        return products.where((p) => (p.quantity ?? 0) > 0).toList();
      case Availability.outOfStock:
        return products.where((p) => (p.quantity ?? 0) == 0).toList();
      default:
        return products;
    }
  }

  List<Product> _sortBy(List<Product> products, SortBy? sortBy) {
    if (sortBy == null) return products;
    switch (sortBy) {
      case SortBy.alphaAsc:
        return products.toList()
          ..sort((a, b) => a.reference!.compareTo(b.reference!));
      case SortBy.alphaDesc:
        return products.toList()
          ..sort((a, b) => b.reference!.compareTo(a.reference!));

      case SortBy.stockAsc:
        return products.toList()
          ..sort((a, b) => (a.quantity ?? 0).compareTo(b.quantity ?? 0));

      case SortBy.stockDesc:
        return products.toList()
          ..sort((a, b) => (b.quantity ?? 0).compareTo(a.quantity ?? 0));

      case SortBy.priceAsc:
        return products.toList()
          ..sort((a, b) => a.unitPrice!.price.compareTo(b.unitPrice!.price));

      case SortBy.priceDesc:
        return products.toList()
          ..sort((a, b) => b.unitPrice!.price.compareTo(a.unitPrice!.price));

      case SortBy.updatedAsc:
        return products.toList()
          ..sort((a, b) => a.updatedAt!.compareTo(b.updatedAt!));

      case SortBy.updatedDesc:
        return products.toList()
          ..sort((a, b) => b.updatedAt!.compareTo(a.updatedAt!));

      default:
        return products;
    }
  }

  List<Product> _filterByLowRotation(
      List<Product> products, bool? isLowRotated) {
    if (isLowRotated == null || !isLowRotated) return products;
    return products.where((p) => p.isLowRotated).toList();
  }
}

typedef FilterParams = ({
  List<Product> products,
  Availability availability,
  String? category,
  SortBy? sortBy,
  bool? isLowRotated,
});
