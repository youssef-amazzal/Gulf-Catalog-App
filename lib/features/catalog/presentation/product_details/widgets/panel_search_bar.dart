import 'package:flutter/material.dart';
import 'package:gulf_catalog_app/core/configs/theme/app_theme.dart';
import 'package:gulf_catalog_app/core/extensions/responsive/responsive.dart';

class PanelSearchBar extends StatelessWidget {
  const PanelSearchBar({
    super.key,
    required this.onChanged,
    required this.hintText,
  });

  final String hintText;
  final void Function(String?) onChanged;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        decoration: BoxDecoration(
          color: colorScheme.surfaceDim,
          borderRadius: BorderRadius.circular(8),
        ),
        child: TextField(
            decoration: InputDecoration(
              fillColor: colorScheme.surfaceDim,
              hintText: hintText,
              prefixIcon: Icon(
                Icons.search,
                color: colorScheme.onSurfaceVariant,
              ),
              prefixIconColor: theme.appColors.onSurfacePrimary,
              hintStyle: context.responsive(
                textTheme.labelMedium!
                    .copyWith(color: colorScheme.onSurfaceVariant),
                xl: textTheme.labelLarge!
                    .copyWith(color: colorScheme.onSurfaceVariant),
              ),
            ),
            onChanged: onChanged),
      ),
    );
  }
}
