import 'package:gulf_catalog_app/core/error/exceptions.dart';
import 'package:gulf_catalog_app/features/catalog/data/models/product_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class ProductsRemoteDataSource {
  Future<List<ProductModel>> getProducts({
    String? reference,
    int? category,
    String? sortOption,
    int? limit,
    int? offset,
  });

  Future<List<ProductModel>> getProductById({required num id});
}

class ProductsRemoteDataSourceImpl extends ProductsRemoteDataSource {
  final SupabaseClient client;

  ProductsRemoteDataSourceImpl({
    required this.client,
  });

  @override
  Future<List<ProductModel>> getProducts({
    String? reference,
    int? category,
    String? sortOption,
    int? limit = 1000,
    int? offset = 0,
  }) async {
    try {
      List<Map<String, dynamic>> data = await client.from('products').select('''
          id,
          ref,
          category:category_id(id, name),
          brand:brand_id(id, name),
          quantity,
          thumbnail:thumbnail(id, url),
          prices(
            id,
            price,
            quantity,
            discount,
            expiration_date
          ),
          updated_at
        ''');

      print(data[0]);
      print(data[1]);
      print(data[2]);

      return data
          .map((e) => ProductModel.fromJson(e))
          .toList()
          .reversed
          .toList();
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<List<ProductModel>> getProductById({required num id}) {
    // TODO: implement getProductById
    throw UnimplementedError();
  }
}
