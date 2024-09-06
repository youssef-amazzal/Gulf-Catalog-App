import 'package:flutter/material.dart';
import 'package:gulf_catalog_app/core/configs/theme/app_theme.dart';

class Panel extends StatelessWidget {
  final Widget child;
  final String title;
  const Panel({super.key, required this.child, required this.title});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Container(
      decoration: BoxDecoration(
          color: theme.appColors.surface1,
          border: Border.all(color: theme.appColors.border, width: 1.5),
          borderRadius: BorderRadius.circular(14)),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(14), topRight: Radius.circular(14)),
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                child: Text(
                  title,
                  style: theme.appTextStyles.h1
                      .copyWith(fontSize: 20, fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ),
          Divider(
            height: 0,
            color: theme.appColors.border,
            thickness: 2,
          ),
          Expanded(
            child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(14),
                    bottomRight: Radius.circular(14)),
                child: child),
          )
        ],
      ),
    );
  }
}
