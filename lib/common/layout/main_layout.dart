import 'package:flutter/material.dart';
import 'package:gulf_catalog_app/core/configs/theme/app_colors.dart';

import '../widgets/top_navbar/navbar.dart';

class MainLayout extends StatelessWidget {
  final Widget child;
  const MainLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(fit: StackFit.expand, children: [
      Container(
        color: AppColors.dark4,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
        child: Column(children: [
          const TopNavBar(),
          const SizedBox(height: 30),
          Expanded(
            child: child,
          )
        ]),
      )
    ]);
  }
}
