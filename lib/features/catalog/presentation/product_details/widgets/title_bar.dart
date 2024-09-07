import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gulf_catalog_app/core/configs/theme/app_theme.dart';
import 'package:gulf_catalog_app/features/catalog/presentation/i18n/categories.i18n.dart';

class TitleBar extends StatelessWidget {
  final String title;
  final String category;

  const TitleBar({
    super.key,
    required this.title,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: theme.appTextStyles.h1),
          const Gap(5),
          Text(category.i18n, style: theme.appTextStyles.bodyAlt1),
        ],
      ),
    ]);
  }
}
