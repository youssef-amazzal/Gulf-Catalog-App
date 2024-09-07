import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gulf_catalog_app/features/catalog/domain/entities/product.dart';
import 'package:gulf_catalog_app/features/catalog/domain/usecases/fetch_product_details.dart';

part 'details_event.dart';
part 'details_state.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  final FetchProductDetails _fetchProductDetails;

  DetailsBloc({required FetchProductDetails fetchProductDetails})
      : _fetchProductDetails = fetchProductDetails,
        super(DetailsInitial()) {
    on<DetailsEvent>((event, emit) => emit(DetailsLoading()));
    on<DetailsFetchEvent>(_onFetchProductDetails);
  }

  FutureOr<void> _onFetchProductDetails(
      DetailsFetchEvent event, Emitter<DetailsState> emit) async {
    final response = await _fetchProductDetails(event.productId);

    response.fold(
      (failure) => emit(DetailsFailedFetching(message: failure.message)),
      (product) => emit(DetailsSuccessfulFetching(product: product)),
    );
  }
}
