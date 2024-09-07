import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:gulf_catalog_app/core/configs/theme/app_theme.dart';
import 'package:gulf_catalog_app/features/catalog/domain/entities/product.dart';
import 'package:gulf_catalog_app/features/catalog/presentation/bloc/catalog/catalog_bloc.dart';
import 'package:gulf_catalog_app/features/catalog/presentation/product_catalog/widgets/tool_bar.dart';
import 'package:gulf_catalog_app/features/catalog/presentation/product_catalog/widgets/product_card.dart';

class ResultsSection extends StatefulWidget {
  const ResultsSection({super.key});

  @override
  State<ResultsSection> createState() => _ResultsSectionState();
}

class _ResultsSectionState extends State<ResultsSection> {
  @override
  void initState() {
    super.initState();
    context.read<CatalogBloc>().add(CatalogFetchEvent());
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Column(children: [
      const ToolBar(),
      const Gap(20),
      Expanded(
          child: BlocConsumer<CatalogBloc, CatalogState>(
        listener: (context, state) {
          if (state is CatalogFailedFetching) {
            print('Failed to fetch products: ${state.message}');
          }
        },
        builder: (context, state) {
          if (state is CatalogSuccessfulFetching) {
            return GridView.count(
                childAspectRatio: 0.8,
                padding: const EdgeInsets.all(0),
                crossAxisCount:
                    (MediaQuery.of(context).size.width ~/ 350).toInt(),
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                children: _generateCards(state.products));
          } else {
            return Center(
              child: CircularProgressIndicator(
                color: theme.appColors.accent,
              ),
            );
          }
        },
      ))
    ]);
  }
}

_generateCards(List<Product> products) {
  return products.map((p) => ProductCard(product: p)).toList();
}
