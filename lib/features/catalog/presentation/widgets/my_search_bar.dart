import 'package:flutter/material.dart';
import 'package:gulf_catalog_app/core/configs/theme/app_theme.dart';

class MySearchBar extends StatelessWidget {
  const MySearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = context.theme;
    return TextField(
      cursorColor: theme.appColors.accent,
      decoration: InputDecoration(
        hintText: "Search product...",
        prefixIcon: const Icon(Icons.search),
        prefixIconColor: theme.appColors.onSurfacePrimary,
        filled: true,
        fillColor: theme.appColors.onAccent,
        hintStyle: theme.appTextStyles.bodyAlt1.copyWith(fontSize: 14),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: theme.appColors.border),
            borderRadius: BorderRadius.circular(14)),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: theme.appColors.border),
          borderRadius: BorderRadius.circular(14),
        ),
      ),
    );
  }
}
