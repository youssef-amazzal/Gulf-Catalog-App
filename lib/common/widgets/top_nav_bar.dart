import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:group_button/group_button.dart';
import 'package:gulf_catalog_app/common/widgets/navigation_button.dart';
import 'package:gulf_catalog_app/core/configs/assets/app_vectors.dart';
import 'package:gulf_catalog_app/core/configs/theme/app_colors.dart';

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
      child: Row(children: [
        Expanded(child: SvgPicture.asset(AppVectors.logo)),
        Row(
          children: [
            GroupButton<MyItem>(
              controller: controller,
              buttons: [
                MyItem(
                  name: 'Home',
                  icon: AppVectors.home,
                ),
                MyItem(name: 'Dashboard', icon: AppVectors.dashboard)
              ],
              onSelected: (content, i, selected) =>
                  debugPrint('${content.name} Button #$i $selected'),
              buttonBuilder: (selected, item, context) => SvgPicture.asset(
                  item.icon,
                  colorFilter: ColorFilter.mode(
                      item.getIconColor(selected), BlendMode.srcIn)), // Icon
            ),
          ],
        ),
        Expanded(
            child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            NavigationButton(
                routeName: 'settings',
                icon: SvgPicture.asset(
                  AppVectors.settings,
                  colorFilter:
                      const ColorFilter.mode(AppColors.grey, BlendMode.srcIn),
                )),
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

  Color getIconColor(bool selected) {
    return selected ? AppColors.accent : AppColors.grey;
  }

  Color getTextColor(bool selected) {
    return selected ? Colors.white : AppColors.grey;
  }
}
