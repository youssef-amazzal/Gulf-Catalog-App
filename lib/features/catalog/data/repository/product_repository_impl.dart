import 'package:fpdart/fpdart.dart';
import 'package:gulf_catalog_app/core/error/failure.dart';
import 'package:gulf_catalog_app/core/error/exceptions.dart';
import 'package:gulf_catalog_app/features/catalog/domain/entities/product.dart';
import 'package:gulf_catalog_app/features/catalog/domain/repository/product_repository.dart';
import 'package:gulf_catalog_app/features/catalog/data/data_sources/remote/products_remote_data_source.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductsRemoteDataSource _productsApiService;

  ProductRepositoryImpl({required ProductsRemoteDataSource source})
      : _productsApiService = source;

  @override
  Future<Either<Failure, List<Product>>> getProducts({
    String? reference,
    int? limit,
    int? offset,
  }) async {
    try {
      final products = await _productsApiService.getProducts(
          reference: reference, limit: limit, offset: offset);

      return right(products);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, Product>> getProductDetails({required int id}) async {
    try {
      final product = await _productsApiService.getProductById(id: id);

      return right(product);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
