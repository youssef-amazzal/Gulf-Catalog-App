import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gulf_catalog_app/common/widgets/action_button/action_button.dart';
import 'package:gulf_catalog_app/core/configs/assets/app_vectors.dart';
import 'package:gulf_catalog_app/core/configs/theme/app_theme.dart';
import 'package:gulf_catalog_app/features/catalog/presentation/widgets/my_search_bar.dart';

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
          const Expanded(
            child: MySearchBar(),
          ),
          VerticalDivider(
            color: theme.appColors.border,
            thickness: 1.5,
            width: 50,
            endIndent: 1,
            indent: 1,
          ),
          ActionButton(
            onPressed: () => {},
            icon: AppVectors.menuDots,
            iconSize: 25.5,
          ),
          const Gap(10),
          ActionButton(
            onPressed: () => {},
            fillColor: theme.appColors.accent,
            text: "Find a vehicle",
          )
        ],
      ),
    );
  }
}
