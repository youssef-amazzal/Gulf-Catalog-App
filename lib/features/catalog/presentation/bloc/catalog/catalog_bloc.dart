import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gulf_catalog_app/features/catalog/domain/entities/product.dart';
import 'package:gulf_catalog_app/features/catalog/domain/usecases/fetch_products.dart';

part 'catalog_event.dart';
part 'catalog_state.dart';

class CatalogBloc extends Bloc<CatalogEvent, CatalogState> {
  final FetchProducts _fetchProducts;

  CatalogBloc({
    required FetchProducts fetchProducts,
  })  : _fetchProducts = fetchProducts,
        super(CatalogInitial()) {
    on<CatalogEvent>((event, emit) {
      emit(CatalogLoading());
    });
    on<CatalogFetchEvent>(_onFetchProducts);
  }

  void _onFetchProducts(
      CatalogFetchEvent event, Emitter<CatalogState> emit) async {
    final response = await _fetchProducts(SearchParams(
        reference: event.reference, limit: event.limit, offset: event.offset));
    // print(response);

    response.fold(
      (failure) => emit(CatalogFailedFetching(message: failure.message)),
      (products) => emit(CatalogSuccessfulFetching(products: products)),
    );
  }
}
