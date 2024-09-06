import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gulf_catalog_app/features/catalog/domain/entities/product_entity.dart';
import 'package:gulf_catalog_app/features/catalog/domain/usecases/fetch_products.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final FetchProducts _fetchProducts;

  ProductBloc({
    required FetchProducts fetchProducts,
  })  : _fetchProducts = fetchProducts,
        super(ProductInitial()) {
    on<ProductEvent>((event, emit) {
      emit(ProductLoading());
    });
    on<FetchProductsEvent>(_onFetchProduct);
  }

  void _onFetchProduct(
      FetchProductsEvent event, Emitter<ProductState> emit) async {
    final response = await _fetchProducts();
    // print(response);

    response.fold(
      (failure) => emit(ProductFailedFetching(message: failure.message)),
      (products) => emit(ProductSuccessfulFetching(products: products)),
    );
  }
}
