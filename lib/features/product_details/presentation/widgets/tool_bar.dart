import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gulf_catalog_app/common/widgets/action_button/action_button.dart';
import 'package:gulf_catalog_app/core/configs/assets/app_vectors.dart';
import 'package:gulf_catalog_app/core/configs/theme/app_theme.dart';

class ToolBar extends StatelessWidget {
  const ToolBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ActionButton(
          onPressed: () => context.pop(),
          icon: AppVectors.backArrow,
        ),
        ActionButton(
          onPressed: () {},
          text: 'Add to Command',
          fillColor: theme.appColors.accent,
          isOutlined: true,
        ),
      ],
    );
  }
}
