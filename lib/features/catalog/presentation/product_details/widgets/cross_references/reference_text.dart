import 'package:flutter/material.dart';
import 'package:gulf_catalog_app/core/configs/theme/app_theme.dart';
import 'package:gulf_catalog_app/core/extensions/responsive/responsive.dart';

class ReferenceText extends StatelessWidget {
  final String reference;
  const ReferenceText({
    super.key,
    required this.reference,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final textTheme = theme.textTheme;

    return Text(
      '- $reference',
      style: context.responsive(textTheme.bodyLarge, xl: textTheme.bodyMedium),
    );
  }
}
