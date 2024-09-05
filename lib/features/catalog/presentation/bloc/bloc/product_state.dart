part of 'product_bloc.dart';

sealed class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

final class ProductInitial extends ProductState {}

final class ProductLoading extends ProductState {}

final class ProductSuccessfulFetching extends ProductState {
  final List<Product> products;
  const ProductSuccessfulFetching({required this.products});

  @override
  List<Object> get props => [products];
}

final class ProductFailedFetching extends ProductState {
  final String message;
  const ProductFailedFetching({required this.message});

  @override
  List<Object> get props => [message];
}
