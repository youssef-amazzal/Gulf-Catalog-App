part of 'catalog_bloc.dart';

@immutable
sealed class CatalogEvent extends Equatable {
  const CatalogEvent();

  @override
  List<Object> get props => [];
}

final class CatalogFetchEvent extends CatalogEvent {}
