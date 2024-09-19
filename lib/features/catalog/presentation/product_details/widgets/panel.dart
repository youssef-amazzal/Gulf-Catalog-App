import 'package:flutter/material.dart';
import 'package:gulf_catalog_app/core/configs/theme/app_theme.dart';
import 'package:gulf_catalog_app/core/configs/theme/new/app_theme.dart';
import 'package:gulf_catalog_app/core/extensions/responsive/responsive.dart';

class Panel extends StatelessWidget {
  final Widget child;
  final String title;
  const Panel({super.key, required this.child, required this.title});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surface,
        // border: Border.all(color: colorScheme.outline, width: 0.5),
        borderRadius: MAppTheme.kRadius,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: MAppTheme.kRadius.topLeft,
              topRight: MAppTheme.kRadius.topRight,
            ),
            child: Container(
              color: colorScheme.inverseSurface,
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.all(context.responsive(20, xl: 25)),
                child: Text(
                  title,
                  style: context.responsive(
                    textTheme.titleMedium!
                        .copyWith(color: colorScheme.onInverseSurface),
                    xl: textTheme.titleLarge!
                        .copyWith(color: colorScheme.onInverseSurface),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: MAppTheme.kRadius.bottomLeft,
                bottomRight: MAppTheme.kRadius.bottomRight,
              ),
              child: child,
            ),
          )
        ],
      ),
    );
  }
}
