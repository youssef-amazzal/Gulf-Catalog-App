import 'package:gulf_catalog_app/core/resources/data_state.dart';
import 'package:gulf_catalog_app/features/category/domain/entities/category_entity.dart';

abstract class CategoryRepository {
  Future<DataState<List<CategoryEntity>>> getCategories();
}
