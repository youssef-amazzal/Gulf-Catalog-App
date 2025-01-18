import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gulf_catalog_app/core/configs/theme/app_theme.dart';
import 'package:gulf_catalog_app/core/extensions/responsive/responsive.dart';
import 'package:gulf_catalog_app/features/catalog/presentation/i18n/catalog.i18n.dart';
import 'package:gulf_catalog_app/features/catalog/presentation/product_catalog/widgets/filter_panel_toggle.dart';
import 'package:gulf_catalog_app/features/catalog/presentation/product_catalog/widgets/result_counter.dart';
import 'package:gulf_catalog_app/features/catalog/presentation/product_catalog/widgets/search_bar.dart';

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
    return context.responsive(
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "catalog".i18n,
                style: context.responsive(
                  textTheme.displaySmall,
                ),
              ),
              const ResultCounter(),
            ],
          ),
          const Gap(20),
          const Row(
            children: [
              Expanded(child: MSearchBar()),
              Gap(15),
              FilterPanelToggle()
            ],
          ),
        ],
      ),
      lg: SizedBox(
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
      ),
    );
  }
}
