import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:group_button/group_button.dart';
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
    final ThemeData theme = context.theme;
    return SizedBox(
      height: 50,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgIcon(
              icon: theme.brightness == Brightness.dark
                  ? AppVectors.darkLogo
                  : AppVectors.lightLogo,
              height: 40),
          const Spacer(),
          BackButtonListener(
            onBackButtonPressed: () =>
                fixSelectionOnBackButtonPressed(context, controller),
            child: GroupButton<MyItem>(
              controller: controller,
              buttons: pages,
              onSelected: (item, i, selected) {
                context.go(item.path);
              },
              buttonBuilder: (isSelected, data, context) => NavBarButton(
                icon: data.icon,
                text: data.name,
                isSelected: isSelected,
              ),
            ),
          ),
          const Spacer(),
          ActionButton(
            onPressed: () => {},
            icon: AppVectors.solidSettings,
            iconColor: theme.appColors.onSurfaceSecondary2,
          ),
          const Gap(10),
          ActionButton(
            onPressed: () => {},
            icon: AppVectors.solidBell,
            iconColor: theme.appColors.onSurfaceSecondary2,
          )
        ],
      ),
    );
  }
}

class MyItem {
  MyItem(
      {required this.index,
      required this.name,
      required this.icon,
      required this.path});
  final int index;
  final String name;
  final String icon;
  final String path;
}

final pages = <MyItem>[
  MyItem(
    index: 0,
    name: 'Catalog',
    path: '/catalog',
    icon: AppVectors.solidHome,
  ),
  MyItem(
      index: 1,
      name: 'Dashboard',
      path: '/dashboard',
      icon: AppVectors.solidCategories),
  MyItem(index: 2, name: 'Clients', path: '/', icon: AppVectors.solidClients)
];

Future<bool> fixSelectionOnBackButtonPressed(
    BuildContext context, GroupButtonController controller) {
  Uri currentPath = GoRouter.of(context).routeInformationProvider.value.uri;
  final currentIndex =
      pages.indexWhere((element) => element.path == currentPath.toString());
  if (currentIndex != -1) controller.selectIndex(currentIndex);
  return Future.value(false);
}
