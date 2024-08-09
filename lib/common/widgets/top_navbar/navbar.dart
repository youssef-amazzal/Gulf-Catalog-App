import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_button/group_button.dart';
import 'package:gulf_catalog_app/common/bloc/theme_cubit.dart';
import 'package:gulf_catalog_app/common/widgets/action_button/action_button.dart';
import 'package:gulf_catalog_app/common/widgets/svg_icon.dart';
import 'package:gulf_catalog_app/core/configs/assets/app_vectors.dart';
import 'package:gulf_catalog_app/core/configs/theme/app_theme.dart';

import 'navbar_button/navbar_button.dart';

class TopNavBar extends StatelessWidget {
  const TopNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = GroupButtonController();
    controller.selectIndex(0);
    return SizedBox(
      height: 50,
      child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        const Expanded(
            child: Align(
                alignment: AlignmentDirectional.centerStart,
                child: SvgIcon(icon: AppVectors.logo, height: 40))),
        GroupButton<MyItem>(
          controller: controller,
          buttons: [
            MyItem(
              name: 'Home',
              icon: AppVectors.home,
            ),
            MyItem(name: 'Dashboard', icon: AppVectors.dashboard),
            MyItem(name: 'Clients', icon: AppVectors.client)
          ],
          onSelected: (content, i, selected) =>
              debugPrint('${content.name} Button #$i $selected'),
          buttonBuilder: (isSelected, data, context) => NavBarButton(
            icon: data.icon,
            text: data.name,
            isSelected: isSelected,
          ),
        ),
        Expanded(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ActionButton(
              onPressed: () => {context.read<ThemeCubit>().toggleTheme()},
              icon: AppVectors.settings,
            ),
          ],
        ))
      ]),
    );
  }
}

class MyItem {
  MyItem({required this.name, required this.icon});
  final String name;
  final String icon;
}
