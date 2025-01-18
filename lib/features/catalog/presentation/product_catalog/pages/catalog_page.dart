import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gulf_catalog_app/core/configs/theme/app_theme.dart';
import 'package:gulf_catalog_app/core/extensions/responsive/responsive.dart';
import 'package:gulf_catalog_app/features/catalog/domain/entities/product.dart';
import 'package:gulf_catalog_app/features/catalog/presentation/bloc/catalog/catalog_bloc.dart';
import 'package:gulf_catalog_app/features/catalog/presentation/bloc/ui/FilterPanel/filter_panel_cubit.dart';
import 'package:gulf_catalog_app/features/catalog/presentation/product_catalog/widgets/catalog_tool_bar.dart';
import 'package:gulf_catalog_app/features/catalog/presentation/product_catalog/widgets/filter_panel.dart';
import 'package:gulf_catalog_app/features/catalog/presentation/product_catalog/widgets/product_card.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final textTheme = theme.textTheme;
    final leftSectionWidth = context.responsive<double>(270, xl: 330);

    return context.responsive(
      const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CatalogToolBar(leftSectionWidth: double.infinity),
          Gap(20),
          Expanded(child: ResultsSection()),
        ],
      ),
      lg: Column(
        children: [
          CatalogToolBar(leftSectionWidth: leftSectionWidth),
          const Gap(20),
          Expanded(
            child: Row(
              children: [
                BlocBuilder<FilterPanelCubit, FilterPanelState>(
                  builder: (context, state) {
                    if (state is FilterPanelVisible) {
                      return FilterPanel(width: leftSectionWidth);
                    }
                    return const SizedBox();
                  },
                ),
                Gap(context.responsive(15, xl: 20)),
                const Expanded(
                  child: ResultsSection(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ResultsSection extends StatefulWidget {
  const ResultsSection({
    super.key,
  });

  @override
  State<ResultsSection> createState() => _ResultsSectionState();
}

class _ResultsSectionState extends State<ResultsSection> {
  @override
  void initState() {
    super.initState();
    context.read<CatalogBloc>().add(const CatalogFetchEvent());
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    return BlocConsumer<CatalogBloc, CatalogState>(
      listener: (context, state) {
        if (state is CatalogFailure) {
          print('Failed to fetch products: ${state.message}');
        }
      },
      builder: (context, catalogState) {
        if (catalogState is CatalogSuccess) {
          final products = catalogState.products;
          return BlocBuilder<FilterPanelCubit, FilterPanelState>(
            builder: (context, state) {
              final count = (state is FilterPanelVisible) ? 3 : 4;
              return GridView.count(
                childAspectRatio: 0.83,
                padding: const EdgeInsets.all(0),
                crossAxisCount: context.responsive(2, lg: count),
                crossAxisSpacing: context.responsive(8, lg: 10, xl: 15),
                mainAxisSpacing: context.responsive(8, lg: 10, xl: 15),
                children: _generateCards(products),
              );
            },
          );
        } else {
          return Center(
            child: CircularProgressIndicator(
              color: colorScheme.primary,
            ),
          );
        }
      },
    );
  }
}

_generateCards(List<Product> products) {
  return products.map((p) => ProductCard(product: p)).toList();
}
