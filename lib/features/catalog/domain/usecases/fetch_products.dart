import 'package:fpdart/fpdart.dart';
import 'package:gulf_catalog_app/core/error/failure.dart';
import 'package:gulf_catalog_app/core/usecase/usecase.dart';
import 'package:gulf_catalog_app/features/catalog/domain/entities/product.dart';
import 'package:gulf_catalog_app/features/catalog/domain/repository/product_repository.dart';

class FetchProducts implements Usecase<List<Product>, SearchParams> {
  final ProductRepository repository;
  FetchProducts({required this.repository});

  @override
  Future<Either<Failure, List<Product>>> call(SearchParams? params) async {
    return await repository.getProducts(
      reference: params?.reference,
      limit: params?.limit,
      offset: params?.offset,
    );
  }
}

class SearchParams {
  final String? reference;
  final int? limit;
  final int? offset;

  SearchParams({this.reference, this.limit, this.offset});
}
