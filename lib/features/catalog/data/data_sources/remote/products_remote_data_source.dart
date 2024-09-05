import 'package:gulf_catalog_app/features/catalog/data/models/product_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class _ProductsRemoteDataSource {
  Future<List<ProductModel>?> getProducts({
    String? reference,
    int? category,
    String? sortOption,
    int? limit,
    int? offset,
  });
}

class ProductsRemoteDataSource extends _ProductsRemoteDataSource {
  final SupabaseClient supabaseClient;

  ProductsRemoteDataSource({
    required this.supabaseClient,
  });

  @override
  Future<List<ProductModel>?> getProducts({
    String? reference,
    int? category,
    String? sortOption,
    int? limit = 1000,
    int? offset = 0,
  }) async {
    try {
      List<Map<String, dynamic>> data =
          await supabaseClient.from('products').select('''
          id,
          ref,
          category:category_id(id, name),
          brand:brand_id(id, name),
          quantity,
          thumbnail:thumbnail(url),
          prices(
            id,
            price,
            quantity,
            discount,
            expiration_date
          )
        ''');
      return data.map((e) => ProductModel.fromJson(e)).toList();
    } catch (error) {
      throw Error();
    }
  }
}
