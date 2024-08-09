import 'package:flutter/material.dart';
import 'package:gulf_catalog_app/common/widgets/svg_icon.dart';
import 'package:gulf_catalog_app/core/configs/theme/app_theme.dart';
import 'package:gulf_catalog_app/core/configs/theme/app_typography.dart';

class ActionButton extends StatelessWidget {
  final String? text;
  final String? icon;
  final Color? color;
  final bool isOutlined;
  final Function() onPressed;

  const ActionButton({
    super.key,
    this.text,
    this.icon,
    this.color,
    this.isOutlined = false,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData theme = context.theme;
    Color surfaceColor =
        isOutlined ? Colors.transparent : color ?? theme.appColors.surface2;

    Color onSurfaceColor = isOutlined
        ? color ?? theme.appColors.onSurfaceSecondary
        : (color != null
            ? theme.appColors.onAccent
            : theme.appColors.onSurfaceSecondary);

    return ElevatedButton(
      onPressed: onPressed,
      style: buildButtonStyle(onSurfaceColor, surfaceColor),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null)
            SvgIcon(icon: icon!, color: onSurfaceColor, height: 24),
          if (icon != null && text != null) const SizedBox(width: 10),
          if (text != null)
            Text(text!,
                style: AppTypography.body1.copyWith(color: onSurfaceColor)),
        ],
      ),
    );
  }

  ButtonStyle buildButtonStyle(Color onSurfaceColor, Color surfaceColor) {
    return ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: RoundedRectangleBorder(
          side: BorderSide(
              color: isOutlined ? onSurfaceColor : Colors.transparent,
              width: 1.5),
          borderRadius: BorderRadius.circular(16),
        ),
        backgroundColor: surfaceColor,
        foregroundColor: onSurfaceColor,
        elevation: 0);
  }
}
