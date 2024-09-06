import 'package:flutter/material.dart';
import 'package:gulf_catalog_app/core/configs/theme/app_theme.dart';

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
    return TextField(
        cursorColor: theme.appColors.accent,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: const Icon(Icons.search),
          prefixIconColor: theme.appColors.onSurfacePrimary,
          filled: true,
          fillColor: theme.appColors.onAccent,
          hintStyle: theme.appTextStyles.bodyAlt1.copyWith(fontSize: 14),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: theme.appColors.border),
              borderRadius: BorderRadius.circular(0)),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: theme.appColors.border),
            borderRadius: BorderRadius.circular(0),
          ),
        ),
        onChanged: onChanged);
  }
}
