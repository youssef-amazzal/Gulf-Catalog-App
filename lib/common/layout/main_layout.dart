import 'package:flutter/material.dart';
import 'package:gulf_catalog_app/common/widgets/navigation_button.dart';
import 'package:gulf_catalog_app/core/configs/assets/app_vectors.dart';
import 'package:gulf_catalog_app/core/configs/theme/app_colors.dart';

import '../widgets/top_nav_bar.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(fit: StackFit.expand, children: [
      Container(
        color: AppColors.black,
      ),
      Column(children: [
        TopNavBar(),
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
      ])
    ]);
  }
}
