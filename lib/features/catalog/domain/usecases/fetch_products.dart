import 'package:fpdart/fpdart.dart';
import 'package:gulf_catalog_app/core/error/failure.dart';
import 'package:gulf_catalog_app/core/usecase/usecase.dart';
import 'package:gulf_catalog_app/features/catalog/domain/entities/product_entity.dart';
import 'package:gulf_catalog_app/features/catalog/domain/repository/product_repository.dart';

class FetchProducts implements Usecase<List<Product>, void> {
  final ProductRepository productRepository;
  FetchProducts({required this.productRepository});

  @override
  Future<Either<Failure, List<Product>>> call([_]) async {
    return await productRepository.getProducts();
  }
}
