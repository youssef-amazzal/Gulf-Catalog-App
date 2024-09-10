import 'package:fpdart/fpdart.dart';
import 'package:gulf_catalog_app/core/error/failure.dart';
import 'package:gulf_catalog_app/features/catalog/domain/entities/product.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<Product>>> getProducts({
    String? reference,
    int? limit,
    int? offset,
  });
  Future<Either<Failure, Product>> getProductDetails({required int id});
}
