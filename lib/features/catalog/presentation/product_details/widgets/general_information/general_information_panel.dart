import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:gap/gap.dart';
import 'package:gulf_catalog_app/common/widgets/svg_icon.dart';
import 'package:gulf_catalog_app/core/configs/assets/app_vectors.dart';
import 'package:gulf_catalog_app/core/configs/theme/app_theme.dart';
import 'package:gulf_catalog_app/core/extensions/responsive/responsive.dart';
import 'package:gulf_catalog_app/features/catalog/domain/entities/product.dart';
import 'package:gulf_catalog_app/features/catalog/domain/entities/section.dart';
import 'package:gulf_catalog_app/features/catalog/presentation/i18n/catalog.i18n.dart';
import 'package:gulf_catalog_app/features/catalog/presentation/product_details/widgets/panel.dart';
import 'package:path/path.dart';

class GeneralInformationPanel extends StatelessWidget {
  final Product product;
  const GeneralInformationPanel({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Panel(
      title: 'general_information'.i18n,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
              child: LayoutBuilder(builder: (context, constrainsts) {
                return Wrap(
                  runSpacing: 18,
                  direction: Axis.vertical,
                  children: _buildDetails(
                    context,
                    product.details ?? [],
                    theme,
                    constrainsts.maxWidth / 2 - (18 / 2),
                  ),
                );
              }),
            ),
          ),
          Divider(
            height: 0,
            thickness: 0.5,
            color: colorScheme.outline,
          ),
          Container(
            color: colorScheme.surface,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: context.responsive(10, xl: 15),
              ),
              child: Row(
                children: [
                  SvgIcon(
                    icon: AppVectors.solidPackage,
                    color: colorScheme.onSurfaceVariant,
                    height: context.responsive(18, xl: 22),
                  ),
                  const Gap(10),
                  Text(
                    '${'stocked_product'.i18n} : ',
                    style: context.responsive(
                      textTheme.labelLarge!.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                      xl: textTheme.labelLarge!.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ),
                  Text(
                    '${product.quantity}',
                    style: context.responsive(
                      textTheme.bodyLarge,
                      xl: textTheme.bodyLarge,
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: _buildPrices(
                      context: context,
                      product: product,
                      theme: theme,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildDetails(
    BuildContext context,
    List<Section> sections,
    ThemeData theme,
    double width,
  ) {
    final textTheme = theme.textTheme;
    return sections
        .map((section) {
          return <Widget>[
            Text(
              section.title,
              style: context.responsive(
                textTheme.titleSmall,
                xl: textTheme.titleLarge,
              ),
            ),
            ...generateKeyValues(section.details)?.map((e) => e) ?? [],
            const Gap(10),
          ];
        })
        .toList()
        .flattened
        .map((widget) => SizedBox(width: width, child: widget))
        .toList();
  }

  List<Widget> _buildPrices({
    required BuildContext context,
    required Product product,
    required ThemeData theme,
  }) {
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    final List<Widget> widgets = [];
    widgets.add(
      Text(
        '${product.unitPrice!.price} Dh',
        style: context.responsive(textTheme.bodyLarge, xl: textTheme.bodyLarge),
      ),
    );

    for (final price in product.packPrices) {
      widgets.add(const Gap(10));
      widgets.add(
        Text(
          '/',
          style: context.responsive(
            textTheme.bodyLarge!.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
            xl: textTheme.bodyLarge!.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ),
      );
      widgets.add(const Gap(10));
      widgets.add(
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: '${price.price} Dh ',
                style: context.responsive(textTheme.bodyLarge,
                    xl: textTheme.bodyLarge),
              ),
              TextSpan(
                text: '(x${price.quantity})',
                style: context.responsive(
                  textTheme.bodyLarge!.copyWith(color: colorScheme.primary),
                  xl: textTheme.bodyLarge!.copyWith(color: colorScheme.primary),
                ),
              )
            ],
          ),
        ),
      );
    }

    return widgets;
  }
}

List<Widget>? generateKeyValues(Map<String, dynamic>? details) {
  return details?.entries
          .map((entry) => _KeyValueRow(title: entry.key, value: entry.value))
          .toList() ??
      [];
}

class _KeyValueRow extends StatelessWidget {
  final String title;
  final dynamic value;
  const _KeyValueRow({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: Text(
            title,
            style: context.responsive(
              textTheme.bodySmall,
              xl: textTheme.bodyLarge,
            ),
          ),
        ),
        Text(
          '$value',
          style: context.responsive(
            textTheme.bodySmall!.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
            xl: textTheme.bodyLarge!.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ),
      ],
    );
  }
}
