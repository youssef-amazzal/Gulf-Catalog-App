import 'package:fpdart/fpdart.dart';
import 'package:gulf_catalog_app/core/error/failure.dart';
import 'package:gulf_catalog_app/features/catalog/domain/entities/product_entity.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<Product>>> getProducts();
}
