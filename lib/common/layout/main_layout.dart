import 'package:flutter/material.dart';
import 'package:gulf_catalog_app/core/configs/theme/app_colors.dart';

import '../widgets/top_navbar/navbar.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(fit: StackFit.expand, children: [
      Container(
        color: AppColors.dark4,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
        child: Column(children: [
          const TopNavBar(),
          SizedBox(
            height: 50,
            child: Row(
              children: [
                Expanded(
                  child: Container(),
                )
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(),
                )
              ],
            ),
          )
        ]),
      )
    ]);
  }
}
