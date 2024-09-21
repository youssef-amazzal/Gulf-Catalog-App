import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gulf_catalog_app/common/types/my_group_button_options.dart';
import 'package:gulf_catalog_app/core/configs/theme/app_theme.dart';
import 'package:gulf_catalog_app/core/configs/theme/new/app_theme.dart';
import 'package:gulf_catalog_app/core/extensions/responsive/responsive.dart';
import 'package:gulf_catalog_app/features/catalog/domain/entities/product.dart';
import 'package:gulf_catalog_app/features/catalog/presentation/bloc/catalog/catalog_bloc.dart';
import 'package:gulf_catalog_app/features/catalog/presentation/i18n/catalog.i18n.dart';
import 'package:gulf_catalog_app/features/catalog/presentation/product_catalog/widgets/search_bar.dart';
import 'package:gulf_catalog_app/features/catalog/presentation/product_catalog/widgets/filters/category_filter.dart';
import 'package:gulf_catalog_app/features/catalog/presentation/product_catalog/widgets/filters/low_rotation_filter.dart';
import 'package:gulf_catalog_app/features/catalog/presentation/product_catalog/widgets/filters/sort_option_filter.dart';
import 'package:gulf_catalog_app/features/catalog/presentation/product_catalog/widgets/filters/status_filter.dart';
import 'package:gulf_catalog_app/features/catalog/presentation/product_catalog/widgets/product_card.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    final leftSectionWidth = context.responsive<double>(270, xl: 330);

    return Column(
      children: [
        CatalogToolBar(leftSectionWidth: leftSectionWidth),
        const Gap(20),
        Expanded(
          child: Row(
            children: [
              FilterPanel(width: leftSectionWidth),
              Gap(context.responsive(15, xl: 20)),
              const Expanded(
                child: ResultsSection(),
              ),
            ],
          ),
        ),
      ],
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
          return GridView.count(
            childAspectRatio: 0.83,
            padding: const EdgeInsets.all(0),
            crossAxisCount: context.responsive(3, xl: 3),
            crossAxisSpacing: context.responsive(10, xl: 15),
            mainAxisSpacing: context.responsive(10, xl: 15),
            children: _generateCards(products),
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

class FilterPanel extends StatelessWidget {
  const FilterPanel({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final colorScheme = theme.colorScheme;
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(16),
        ),
        width: width,
        child: Column(
          children: [
            Expanded(
              child: ScrollConfiguration(
                behavior:
                    ScrollConfiguration.of(context).copyWith(scrollbars: false),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: LayoutBuilder(builder: (context, constraints) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CategoryFilter(),
                          Gap(context.responsive(10, xl: 20)),
                          const SortOptionFilter(),
                          Gap(context.responsive(10, xl: 20)),
                          StatusFilter(
                            options: [
                              (
                                label: "all".i18n,
                                width: constraints.maxWidth,
                                status: Availability.all,
                              ),
                              (
                                label: "in_stock".i18n,
                                width: (constraints.maxWidth - 5) / 2,
                                status: Availability.inStock,
                              ),
                              (
                                label: "out_of_stock".i18n,
                                width: (constraints.maxWidth - 5) / 2,
                                status: Availability.outOfStock,
                              ),
                            ],
                          ),
                          Gap(context.responsive(10, xl: 20)),
                          LowRotationFilter(
                            options: [
                              (
                                label: "low_rotation".i18n,
                                width: constraints.maxWidth,
                              ),
                            ],
                          ),
                        ],
                      );
                    }),
                  ),
                ),
              ),
            ),
            const ResetButton()
          ],
        ),
      ),
    );
  }
}

class CatalogToolBar extends StatelessWidget {
  const CatalogToolBar({
    super.key,
    required this.leftSectionWidth,
  });

  final double leftSectionWidth;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    return SizedBox(
      height: context.responsive<double>(40, xl: 50),
      child: Row(
        children: [
          SizedBox(
            width: leftSectionWidth,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "catalog".i18n,
                  style: context.responsive(
                    textTheme.headlineLarge,
                    xl: textTheme.displayLarge,
                  ),
                ),
                const ResultCounter(),
              ],
            ),
          ),
          Gap(context.responsive(15, xl: 20)),
          const Expanded(child: MSearchBar()),
          VerticalDivider(
            width: 40,
            indent: 3,
            endIndent: 3,
            color: colorScheme.outline,
          ),
          const FilterPanelToggle()
        ],
      ),
    );
  }
}

class ResetButton extends StatelessWidget {
  const ResetButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    return Container(
      decoration: BoxDecoration(
        color: colorScheme.inverseSurface,
      ),
      child: ElevatedButton(
        onPressed: () {
          context.read<CatalogBloc>().add(CatalogReset());
        },
        style: ElevatedButton.styleFrom(
          overlayColor: colorScheme.onInverseSurface,
        ),
        child: Padding(
          padding: EdgeInsets.all(context.responsive(16, xl: 24)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.restart_alt_rounded,
                color: colorScheme.onInverseSurface,
                size: context.responsive(20, xl: 24),
              ),
              const Gap(10),
              Text(
                'reset_filters'.i18n,
                style: context.responsive(
                  textTheme.labelLarge!.copyWith(
                    color: colorScheme.onInverseSurface,
                  ),
                  xl: textTheme.titleMedium!.copyWith(
                    color: colorScheme.onInverseSurface,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class FilterPanelToggle extends StatelessWidget {
  const FilterPanelToggle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final colorScheme = theme.colorScheme;
    return Container(
        decoration: BoxDecoration(
          color: colorScheme.primary,
          borderRadius: MAppTheme.kRadius,
        ),
        child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.filter_alt_outlined,
              color: colorScheme.onPrimary,
            )));
  }
}

class ResultCounter extends StatelessWidget {
  const ResultCounter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 7,
        horizontal: context.responsive(15, xl: 20),
      ),
      height: context.responsive<double>(40, xl: 50),
      decoration: BoxDecoration(
        color: colorScheme.primary.withOpacity(0.15),
        // border: Border.all(color: colorScheme.outline),
        borderRadius: BorderRadius.circular(100),
      ),
      child: BlocBuilder<CatalogBloc, CatalogState>(
        builder: (context, state) {
          int total = 0;
          if (state is CatalogSuccess) {
            total = state.products.length;
          }
          return Center(
            child: RichText(
              text: TextSpan(
                text: '$total ',
                style: context.responsive(
                  textTheme.labelMedium!.copyWith(color: colorScheme.primary),
                  xl: textTheme.labelLarge!
                      .copyWith(color: colorScheme.primary),
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: 'total_products'.i18n,
                    style: context.responsive(
                      textTheme.labelSmall!.copyWith(
                        color: colorScheme.primary,
                      ),
                      xl: textTheme.labelMedium!.copyWith(
                        color: colorScheme.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
