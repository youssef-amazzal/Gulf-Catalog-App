import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'filter_panel.dart';
import 'results_section.dart';

class CatalogPage extends StatefulWidget {
  const CatalogPage({
    super.key,
  });

  @override
  State<CatalogPage> createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  // late Future<List<ProductModel>> _productsFuture;

  @override
  void initState() {
    super.initState();
    // _productsFuture = _loadProducts();
  }

  // Future<List<ProductModel>> _loadProducts() async {
  //   // Supbase Initialization
  //   await loadSupabase();

  //   List<ProductModel> products =
  //       await GetProductsSupabase(supabaseClient: Supabase.instance.client)
  //           .getProducts();
  //   print(products[1]);
  //   return products;
  // }

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [FilterPanel(), Gap(20), Expanded(child: ResultsSection())],
    );
  }
}
