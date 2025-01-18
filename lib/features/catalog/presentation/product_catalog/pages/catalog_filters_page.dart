import 'package:flutter/material.dart';
import 'package:gulf_catalog_app/features/catalog/presentation/product_catalog/widgets/filter_panel.dart';

class CatalogFiltersPage extends StatelessWidget {
  const CatalogFiltersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: FilterPanel(width: double.infinity));
  }
}
