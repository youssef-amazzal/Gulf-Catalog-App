import 'package:fpdart/fpdart.dart';
import 'package:gulf_catalog_app/core/error/failure.dart';
import 'package:gulf_catalog_app/core/error/exceptions.dart';
import 'package:gulf_catalog_app/features/catalog/domain/entities/product_entity.dart';
import 'package:gulf_catalog_app/features/catalog/domain/repository/product_repository.dart';
import 'package:gulf_catalog_app/features/catalog/data/data_sources/remote/products_remote_data_source.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductsRemoteDataSource _productsApiService;

  ProductRepositoryImpl({required ProductsRemoteDataSource source})
      : _productsApiService = source;

  @override
  Future<Either<Failure, List<Product>>> getProducts() async {
    try {
      final products = await _productsApiService.getProducts();

      return right(products);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, Product>> getProductDetails() {
    // TODO: implement getProductExtended
    throw UnimplementedError();
  }
}
