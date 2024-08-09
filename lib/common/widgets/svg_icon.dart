import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgIcon extends StatelessWidget {
  final String icon;
  final Color color;
  final double height;

  const SvgIcon({
    required this.icon,
    required this.color,
    required this.height,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(icon,
        height: height, colorFilter: ColorFilter.mode(color, BlendMode.srcIn));
  }
}
