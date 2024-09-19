part of 'catalog_bloc.dart';

sealed class CatalogState extends Equatable {
  const CatalogState();

  @override
  List<Object?> get props => [];
}

final class CatalogInitial extends CatalogState {}

final class CatalogLoading extends CatalogState {}

final class CatalogSuccess extends CatalogState {
  final List<Product> products;
  const CatalogSuccess({required this.products});

  @override
  List<Object> get props => [products];
}

final class CatalogFailure extends CatalogState {
  final String message;
  const CatalogFailure({required this.message});

  @override
  List<Object> get props => [message];
}

final class CatalogResetState extends CatalogState {}

enum Availability { all, inStock, outOfStock }

enum SortBy {
  alphaAsc,
  alphaDesc,
  stockAsc,
  stockDesc,
  priceAsc,
  priceDesc,
  updatedAsc,
  updatedDesc
}
