import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gulf_catalog_app/core/configs/theme/app_theme.dart';
import 'package:gulf_catalog_app/core/extensions/responsive/responsive.dart';
import 'package:gulf_catalog_app/features/catalog/presentation/bloc/catalog/catalog_bloc.dart';
import 'package:gulf_catalog_app/features/catalog/presentation/i18n/catalog.i18n.dart';
import 'package:gulf_catalog_app/features/catalog/presentation/product_catalog/pages/catalog_page.dart';
import 'package:gulf_catalog_app/features/catalog/presentation/product_catalog/widgets/filters/category_filter.dart';
import 'package:gulf_catalog_app/features/catalog/presentation/product_catalog/widgets/filters/low_rotation_filter.dart';
import 'package:gulf_catalog_app/features/catalog/presentation/product_catalog/widgets/filters/sort_option_filter.dart';
import 'package:gulf_catalog_app/features/catalog/presentation/product_catalog/widgets/filters/status_filter.dart';
import 'package:gulf_catalog_app/features/catalog/presentation/product_catalog/widgets/reset_button.dart';

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
