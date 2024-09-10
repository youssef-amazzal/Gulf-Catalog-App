part of 'catalog_bloc.dart';

@immutable
sealed class CatalogEvent {
  const CatalogEvent();
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
}
