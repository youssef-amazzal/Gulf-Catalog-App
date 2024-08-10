import 'package:flutter/material.dart';
import 'package:gulf_catalog_app/core/configs/theme/app_theme.dart';
import 'package:gulf_catalog_app/common/widgets/action_button/action_button.dart';
import 'package:gulf_catalog_app/core/configs/assets/app_vectors.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ToolBar(),
        SizedBox(height: 20),
        Expanded(
          child: Row(
            children: [FilterPanel()],
          ),
        ),
      ],
    );
  }
}

class FilterPanel extends StatelessWidget {
  const FilterPanel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData theme = context.theme;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: theme.appColors.surface1,
        borderRadius: BorderRadius.circular(16),
      ),
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Product Status",
            style: theme.appTextStyles.bodyAlt1,
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}

class ToolBar extends StatelessWidget {
  const ToolBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData theme = context.theme;
    return SizedBox(
      height: 50,
      child: Row(
        children: [
          Text(
            'Catalog',
            style: theme.appTextStyles.h1,
          ),
          const SizedBox(width: 10),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            decoration: BoxDecoration(
              border: Border.all(color: theme.appColors.border, width: 2),
              borderRadius: BorderRadius.circular(100),
            ),
            child: RichText(
              text: TextSpan(
                text: '2984 ',
                style: theme.appTextStyles.body1.copyWith(fontSize: 14),
                children: <TextSpan>[
                  TextSpan(
                      text: 'total products',
                      style:
                          theme.appTextStyles.bodyAlt1.copyWith(fontSize: 13)),
                ],
              ),
            ),
          ),
          const Spacer(),
          VerticalDivider(
            color: theme.appColors.surface3,
            thickness: 1,
            width: 50,
            endIndent: 1,
            indent: 1,
          ),
          ActionButton(
            onPressed: () => {},
            icon: AppVectors.settings,
          ),
          const SizedBox(width: 10),
          ActionButton(
            onPressed: () => {},
            color: theme.appColors.accent,
            text: "Action Button",
          )
        ],
      ),
    );
  }
}
