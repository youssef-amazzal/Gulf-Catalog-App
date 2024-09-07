import 'package:fpdart/fpdart.dart';
import 'package:gulf_catalog_app/core/error/failure.dart';
import 'package:gulf_catalog_app/core/usecase/usecase.dart';
import 'package:gulf_catalog_app/features/catalog/catalog.dart';
import 'package:gulf_catalog_app/features/catalog/domain/entities/product.dart';

class FetchProductDetails implements Usecase<Product, int> {
  final ProductRepository repository;

  FetchProductDetails({required this.repository});
  @override
  Future<Either<Failure, Product>> call(int id) async {
    return await repository.getProductDetails(id: id);
  }
}
