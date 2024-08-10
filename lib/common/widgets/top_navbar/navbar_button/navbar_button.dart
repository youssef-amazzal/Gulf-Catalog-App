import 'package:flutter/material.dart';
import 'package:gulf_catalog_app/common/widgets/svg_icon.dart';
import 'package:gulf_catalog_app/core/configs/theme/app_theme.dart';

class NavBarButton extends StatelessWidget {
  final String icon;
  final String text;
  final bool isSelected;

  const NavBarButton({
    required this.icon,
    required this.text,
    required this.isSelected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData theme = context.theme;
    return Container(
      decoration: BoxDecoration(
          color: isSelected ? theme.appColors.surface2 : Colors.transparent,
          border: Border.all(
              color: theme.appColors.border, width: 2), // border: width, radius
          borderRadius: BorderRadius.circular(100)),
      padding:
          const EdgeInsets.symmetric(vertical: 5, horizontal: 20), // padding
      child: Row(
        children: [
          SvgIcon(
              icon: icon,
              color: isSelected
                  ? theme.appColors.accent
                  : theme.appColors.onSurfaceSecondary,
              height: 18), // icon: height
          const SizedBox(width: 10), // spacing
          Text(text,
              style: isSelected
                  ? theme.appTextStyles.body1
                  : theme.appTextStyles.bodyAlt1),
        ],
      ),
    );
  }
}
