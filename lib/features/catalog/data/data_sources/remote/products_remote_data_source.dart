import 'package:gulf_catalog_app/core/error/exceptions.dart';
import 'package:gulf_catalog_app/features/catalog/data/models/product_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class ProductsRemoteDataSource {
  Future<List<ProductModel>> getProducts({
    String? reference,
    int? limit,
    int? offset,
  });

  Future<ProductModel> getProductById({required num id});
}

class ProductsRemoteDataSourceImpl extends ProductsRemoteDataSource {
  final SupabaseClient client;

  ProductsRemoteDataSourceImpl({
    required this.client,
  });

  @override
  Future<List<ProductModel>> getProducts({
    String? reference,
    int? limit = 1000,
    int? offset = 0,
  }) async {
    try {
      List<Map<String, dynamic>> data = await client.rpc(
          'get_products_by_search_term',
          params: {'search_term': reference ?? ''});

      return data.map((e) => ProductModel.fromJson(e)).toList();
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<ProductModel> getProductById({required num id}) async {
    try {
      List<Map<String, dynamic>> data = await client.from('products').select('''
          id,
          ref,
          category:category_id(id, name),
          brand:brand_id(id, name, logo),
          quantity,
          details,
          images!product_images(
            id,
            url
          ),
          prices(
            price,
            quantity,
            discount,
            expiration_date
          ),
          cross_refs(
            id,
            ref,
            brand:brands(id, name, logo)
          ),
           oe_refs(
            id,
            ref,
            mfr:manufacturers(id, name, logo)
          ),
          vehicles(id, name, kw, hp, engine, begin_year_month, end_year_month)
        ''').eq('id', id);

      // print(data[0]['cross_refs']);

      return ProductModel.fromJson(data[0]);
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}
