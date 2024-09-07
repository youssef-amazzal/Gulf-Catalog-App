import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:gap/gap.dart';
import 'package:gulf_catalog_app/common/widgets/svg_icon.dart';
import 'package:gulf_catalog_app/core/configs/assets/app_vectors.dart';
import 'package:gulf_catalog_app/core/configs/theme/app_theme.dart';
import 'package:gulf_catalog_app/features/catalog/domain/entities/product.dart';
import 'package:gulf_catalog_app/features/catalog/domain/entities/section.dart';
import 'package:gulf_catalog_app/features/catalog/presentation/product_details/widgets/panel.dart';

class GeneralInformationPanel extends StatelessWidget {
  final Product product;
  const GeneralInformationPanel({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Panel(
      title: 'General Information',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
              child: SizedBox(
                child: Wrap(
                  runSpacing: 35,
                  direction: Axis.vertical,
                  children: _buildDetails(product.details ?? [], theme),
                ),
              ),
            ),
          ),
          Divider(
            height: 0,
            thickness: 2,
            color: theme.appColors.border,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
            child: Row(
              children: [
                SvgIcon(
                  icon: AppVectors.package,
                  color: theme.appColors.onSurfaceSecondary1,
                  height: 25,
                ),
                const Gap(10),
                Text(
                  'Stocked Product : ',
                  style: theme.appTextStyles.bodyAlt1.copyWith(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${product.quantity}',
                  style: theme.appTextStyles.body1.copyWith(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
                Row(
                  children: _buildPrices(product: product, theme: theme),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildDetails(List<Section> sections, ThemeData theme) {
    return sections
        .map((section) {
          return <Widget>[
            Text(
              section.title,
              style: theme.appTextStyles.h1
                  .copyWith(fontSize: 17, fontWeight: FontWeight.w800),
            ),
            ...generateKeyValues(section.details)?.map((e) => e) ?? [],
            const Gap(30),
          ];
        })
        .toList()
        .flattened
        .map((widget) => SizedBox(width: 300, child: widget))
        .toList();
  }

  List<Widget> _buildPrices(
      {required Product product, required ThemeData theme}) {
    List<Widget> widgets = [];
    widgets.add(
      Text(
        '${product.unitPrice!.price} Dh',
        style:
            theme.appTextStyles.body1.copyWith(fontWeight: FontWeight.normal),
      ),
    );

    for (final price in product.packPrices) {
      widgets.add(const Gap(10));
      widgets.add(
        Text(
          '/',
          style: theme.appTextStyles.bodyAlt1,
        ),
      );
      widgets.add(const Gap(10));
      widgets.add(
        Text(
          '${price.price} Dh (x${price.quantity})',
          style:
              theme.appTextStyles.body1.copyWith(fontWeight: FontWeight.normal),
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
  const _KeyValueRow({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: Text(
            title,
            style: theme.appTextStyles.body1.copyWith(
              fontSize: 13.5,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const Gap(5),
        Text(
          '$value',
          style: theme.appTextStyles.bodyAlt1.copyWith(
            fontSize: 13.5,
            color: theme.appColors.onSurfaceSecondary2,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
