import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gulf_catalog_app/core/configs/theme/app_theme.dart';

class TitleBar extends StatelessWidget {
  const TitleBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('CF-112', style: theme.appTextStyles.h1),
          const Gap(5),
          Text('Butée d\'embrayage', style: theme.appTextStyles.bodyAlt1),
        ],
      ),
    ]);
  }
}
