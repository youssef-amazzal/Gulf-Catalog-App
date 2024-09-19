import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gulf_catalog_app/features/catalog/domain/entities/product.dart';
import 'package:gulf_catalog_app/features/catalog/domain/usecases/fetch_products.dart';
import 'package:gulf_catalog_app/features/catalog/domain/usecases/filter_products.dart';

part 'catalog_event.dart';
part 'catalog_state.dart';

class CatalogBloc extends Bloc<CatalogEvent, CatalogState> {
  final FetchProducts _fetchProducts;
  final FilterProducts _filterProducts;
  CatalogFilterEvent? _previousFilterEvent;
  List<Product>? _products;

  CatalogBloc({
    required FetchProducts fetchProducts,
    required FilterProducts filterProducts,
  })  : _fetchProducts = fetchProducts,
        _filterProducts = filterProducts,
        super(CatalogInitial()) {
    on<CatalogEvent>((event, emit) {
      emit(CatalogLoading());
    });
    on<CatalogFetchEvent>(_onFetchProducts);
    on<CatalogFilterEvent>(_onFilterProducts);
    on<CatalogReset>(_onCatalogReset);
  }

  void _onFetchProducts(
      CatalogFetchEvent event, Emitter<CatalogState> emit) async {
    final response = await _fetchProducts(
        (reference: event.reference, limit: event.limit, offset: event.offset));
    // print(response);

    response.fold(
      (failure) => emit(CatalogFailure(message: failure.message)),
      (products) {
        _products = products;
        emit(CatalogSuccess(products: products));
      },
    );
  }

  void _onFilterProducts(
      CatalogFilterEvent event, Emitter<CatalogState> emit) async {
    _previousFilterEvent = event;
    final response = await _filterProducts(
      (
        products: event.products,
        availability: event.availability,
        category: event.category,
        sortBy: event.sortBy,
      ),
    );

    response.fold(
      (failure) => emit(CatalogFailure(message: failure.message)),
      (products) => emit(CatalogSuccess(products: products)),
    );
  }

  void _onCatalogReset(CatalogReset event, Emitter<CatalogState> emit) {
    emit(CatalogResetState());
    _previousFilterEvent = null;

    add(CatalogFilterEvent(products: _products!));
  }

  void filter({Availability? availability, String? category, SortBy? sortBy}) {
    if (state is CatalogSuccess) {
      final event = _previousFilterEvent?.copyWith(
            products: _products,
            category: category,
            availability: availability,
            sortBy: sortBy,
          ) ??
          CatalogFilterEvent(
            products: _products!,
            category: category,
            availability: availability ?? Availability.all,
            sortBy: sortBy,
          );

      add(event);
    }
  }
}
