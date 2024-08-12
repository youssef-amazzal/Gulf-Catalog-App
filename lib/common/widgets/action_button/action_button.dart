import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gulf_catalog_app/common/widgets/svg_icon.dart';
import 'package:gulf_catalog_app/core/configs/theme/app_theme.dart';

class ActionButton extends StatelessWidget {
  final String? text;
  final String? icon;
  final Color? iconColor;
  final double? iconSize;
  final Color? fillColor;
  final bool isOutlined;
  final Function() onPressed;

  const ActionButton({
    super.key,
    this.text,
    this.icon,
    this.iconColor,
    this.iconSize,
    this.fillColor,
    this.isOutlined = false,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData theme = context.theme;
    Color surfaceColor =
        isOutlined ? Colors.transparent : fillColor ?? theme.appColors.surface2;

    Color onSurfaceColor = isOutlined
        ? fillColor ?? theme.appColors.onSurfaceSecondary1
        : (fillColor != null
            ? theme.appColors.onAccent
            : theme.appColors.onSurfaceSecondary1);

    return SizedBox(
      height: 45,
      width: icon == null ? null : 45,
      child: ElevatedButton(
        onPressed: onPressed,
        style: buildButtonStyle(onSurfaceColor, surfaceColor),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null)
              SvgIcon(
                  icon: icon!,
                  color: iconColor ?? onSurfaceColor,
                  height: iconSize ?? 24),
            if (icon != null && text != null) const Gap(10),
            if (text != null)
              Text(text!,
                  style: theme.appTextStyles.body1.copyWith(
                      color: onSurfaceColor, fontWeight: FontWeight.w700)),
          ],
        ),
      ),
    );
  }

  ButtonStyle buildButtonStyle(Color onSurfaceColor, Color surfaceColor) {
    return ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(
            vertical: text == null ? 0 : 10, horizontal: text == null ? 0 : 20),
        shape: RoundedRectangleBorder(
          side: BorderSide(
              color: isOutlined ? onSurfaceColor : Colors.transparent,
              width: 1.5),
          borderRadius: BorderRadius.circular(14),
        ),
        backgroundColor: surfaceColor,
        foregroundColor: onSurfaceColor,
        elevation: 0);
  }
}
