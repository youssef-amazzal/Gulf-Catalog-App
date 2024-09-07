part of 'catalog_bloc.dart';

sealed class CatalogState extends Equatable {
  const CatalogState();

  @override
  List<Object> get props => [];
}

final class CatalogInitial extends CatalogState {}

final class CatalogLoading extends CatalogState {}

final class CatalogSuccessfulFetching extends CatalogState {
  final List<Product> products;
  const CatalogSuccessfulFetching({required this.products});

  @override
  List<Object> get props => [products];
}

final class CatalogFailedFetching extends CatalogState {
  final String message;
  const CatalogFailedFetching({required this.message});

  @override
  List<Object> get props => [message];
}
