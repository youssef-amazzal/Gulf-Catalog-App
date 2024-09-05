import 'package:gulf_catalog_app/core/resources/data_state.dart';
import 'package:gulf_catalog_app/features/category/domain/entities/category_entity.dart';
import 'package:gulf_catalog_app/features/category/domain/repository/category_repository.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  @override
  Future<DataState<List<CategoryEntity>>> getCategories() {
    // TODO: implement getCategories
    throw UnimplementedError();
  }
}
