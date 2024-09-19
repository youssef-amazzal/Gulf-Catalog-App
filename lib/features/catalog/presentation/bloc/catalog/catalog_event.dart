part of 'catalog_bloc.dart';

@immutable
sealed class CatalogEvent extends Equatable {
  const CatalogEvent();

  @override
  List<Object?> get props => [];
}

final class CatalogFetchEvent extends CatalogEvent {
  final String? reference;
  final int? limit;
  final int? offset;

  const CatalogFetchEvent({
    this.reference,
    this.limit,
    this.offset,
  });

  @override
  List<Object?> get props => [reference, limit, offset];
}

final class CatalogFilterEvent extends CatalogEvent {
  final List<Product> products;
  final Availability availability;
  final String? category;
  final SortBy? sortBy;

  const CatalogFilterEvent({
    required this.products,
    this.category,
    this.availability = Availability.all,
    this.sortBy,
  });

  // Copy with
  CatalogFilterEvent copyWith({
    List<Product>? products,
    Availability? availability,
    String? category,
    SortBy? sortBy,
  }) {
    return CatalogFilterEvent(
      products: products ?? this.products,
      availability: availability ?? this.availability,
      category: category ?? this.category,
      sortBy: sortBy ?? this.sortBy,
    );
  }

  @override
  List<Object?> get props => [products, category, availability, sortBy];
}

final class CatalogReset extends CatalogEvent {}
