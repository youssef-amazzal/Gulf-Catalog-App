import 'package:fpdart/fpdart.dart';
import 'package:gulf_catalog_app/core/error/failure.dart';
import 'package:gulf_catalog_app/features/catalog/data/data_sources/remote/products_remote_data_source.dart';
import 'package:gulf_catalog_app/features/catalog/domain/entities/product_entity.dart';
import 'package:gulf_catalog_app/features/catalog/domain/repository/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductsRemoteDataSource _productsApiService;

  ProductRepositoryImpl({required ProductsRemoteDataSource productsApiService})
      : _productsApiService = productsApiService;

  @override
  Future<Either<Failure, List<Product>>> getProducts() {
    throw UnimplementedError();
  }
}
