import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gulf_catalog_app/core/configs/theme/app_theme.dart';

class LabeledWidget extends StatelessWidget {
  final String label;
  final Widget child;

  const LabeledWidget({super.key, required this.label, required this.child});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: theme.appTextStyles.bodyAlt1.copyWith(fontSize: 12),
        ),
        const Gap(5),
        child
      ],
    );
  }
}
