import 'package:fpdart/fpdart.dart';
import 'package:gulf_catalog_app/core/error/failure.dart';
import 'package:gulf_catalog_app/features/catalog/domain/entities/category_entity.dart';
import 'package:gulf_catalog_app/features/catalog/domain/repository/category_repository.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  @override
  Future<Either<Failure, List<CategoryEntity>>> getCategories() {
    throw UnimplementedError();
  }
}
