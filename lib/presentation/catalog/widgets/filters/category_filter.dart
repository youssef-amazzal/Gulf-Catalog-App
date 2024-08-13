import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gulf_catalog_app/common/widgets/drop_down.dart';
import 'package:gulf_catalog_app/common/widgets/labeled_widget.dart';
import 'package:gulf_catalog_app/common/widgets/svg_icon.dart';
import 'package:gulf_catalog_app/core/configs/assets/app_vectors.dart';
import 'package:gulf_catalog_app/core/configs/theme/app_theme.dart';

class CategoryFilter extends StatelessWidget {
  const CategoryFilter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return LabeledWidget(
      label: "CATEGORY",
      child: DropDown<_CatalogCategory>(
        hintText: 'All Categories',
        hintIcon: Icons.category_rounded,
        items: _getCategories(),
        itemBuilder: (item) => DropdownMenuItem(
          value: item,
          enabled: item.type == DropDownItemType.data,
          child: item.type == DropDownItemType.header
              ? Text(
                  item.category,
                  style: theme.appTextStyles.body1.copyWith(fontSize: 13),
                  overflow: TextOverflow.ellipsis,
                )
              : Row(
                  children: [
                    const Gap(20),
                    Expanded(
                      child: Text(
                        item.category,
                        style: theme.appTextStyles.body1.copyWith(
                            fontSize: 13, fontWeight: FontWeight.normal),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
        ),
        onSearch: (item, query) {
          return item.value!.category
              .toLowerCase()
              .contains(query.toLowerCase());
        },
      ),
    );
  }

  List<_CatalogCategory> _getCategories() {
    return [
      _CatalogCategory(
          category: 'Engine Maintenance',
          type: DropDownItemType.header,
          icon: const SvgIcon(icon: AppVectors.package, height: 15)),
      _CatalogCategory(
          category: 'Filters',
          type: DropDownItemType.data,
          icon: const SvgIcon(icon: AppVectors.package, height: 15)),
      _CatalogCategory(
          category: 'Additives',
          type: DropDownItemType.data,
          icon: const SvgIcon(icon: AppVectors.package, height: 15)),
      _CatalogCategory(
          category: 'Lubricants',
          type: DropDownItemType.data,
          icon: const SvgIcon(icon: AppVectors.package, height: 15)),
      _CatalogCategory(
          category: 'Braking System',
          type: DropDownItemType.header,
          icon: const SvgIcon(icon: AppVectors.package, height: 15)),
      _CatalogCategory(
          category: 'Brake Discs',
          type: DropDownItemType.data,
          icon: const SvgIcon(icon: AppVectors.package, height: 15)),
      _CatalogCategory(
          category: 'Brake Shoes',
          type: DropDownItemType.data,
          icon: const SvgIcon(icon: AppVectors.package, height: 15)),
      _CatalogCategory(
          category: 'Brake Pads',
          type: DropDownItemType.data,
          icon: const SvgIcon(icon: AppVectors.package, height: 15)),
      _CatalogCategory(
          category: 'Wear Indicators',
          type: DropDownItemType.data,
          icon: const SvgIcon(icon: AppVectors.package, height: 15)),
      _CatalogCategory(
          category: 'Wheel Cylinders',
          type: DropDownItemType.data,
          icon: const SvgIcon(icon: AppVectors.package, height: 15)),
      _CatalogCategory(
          category: 'Brake Master Cylinders',
          type: DropDownItemType.data,
          icon: const SvgIcon(icon: AppVectors.package, height: 15)),
      _CatalogCategory(
          category: 'Clutch System',
          type: DropDownItemType.header,
          icon: const SvgIcon(icon: AppVectors.package, height: 15)),
      _CatalogCategory(
          category: 'Clutch Master Cylinders',
          type: DropDownItemType.data,
          icon: const SvgIcon(icon: AppVectors.package, height: 15)),
      _CatalogCategory(
          category: 'Clutch Slave Cylinders',
          type: DropDownItemType.data,
          icon: const SvgIcon(icon: AppVectors.package, height: 15)),
      _CatalogCategory(
          category: 'Clutch Release Bearings',
          type: DropDownItemType.data,
          icon: const SvgIcon(icon: AppVectors.package, height: 15)),
      _CatalogCategory(
          category: 'Suspension System',
          type: DropDownItemType.header,
          icon: const SvgIcon(icon: AppVectors.package, height: 15)),
      _CatalogCategory(
          category: 'Shock Absorbers',
          type: DropDownItemType.data,
          icon: const SvgIcon(icon: AppVectors.package, height: 15)),
      _CatalogCategory(
          category: 'Axle Suspension',
          type: DropDownItemType.data,
          icon: const SvgIcon(icon: AppVectors.package, height: 15)),
      _CatalogCategory(
          category: 'Wheel Bearings',
          type: DropDownItemType.data,
          icon: const SvgIcon(icon: AppVectors.package, height: 15)),
      _CatalogCategory(
          category: 'Timing and Drive',
          type: DropDownItemType.header,
          icon: const SvgIcon(icon: AppVectors.package, height: 15)),
      _CatalogCategory(
          category: 'Timing Belts',
          type: DropDownItemType.data,
          icon: const SvgIcon(icon: AppVectors.package, height: 15)),
      _CatalogCategory(
          category: 'Timing Kits',
          type: DropDownItemType.data,
          icon: const SvgIcon(icon: AppVectors.package, height: 15)),
      _CatalogCategory(
          category: 'Timing Chains',
          type: DropDownItemType.data,
          icon: const SvgIcon(icon: AppVectors.package, height: 15)),
      _CatalogCategory(
          category: 'Cooling System',
          type: DropDownItemType.header,
          icon: const SvgIcon(icon: AppVectors.package, height: 15)),
      _CatalogCategory(
          category: 'Water Pumps',
          type: DropDownItemType.data,
          icon: const SvgIcon(icon: AppVectors.package, height: 15)),
      _CatalogCategory(
          category: 'Radiator Fans',
          type: DropDownItemType.data,
          icon: const SvgIcon(icon: AppVectors.package, height: 15)),
      _CatalogCategory(
          category: 'Radiators',
          type: DropDownItemType.data,
          icon: const SvgIcon(icon: AppVectors.package, height: 15)),
      _CatalogCategory(
          category: 'Coolants',
          type: DropDownItemType.data,
          icon: const SvgIcon(icon: AppVectors.package, height: 15)),
      _CatalogCategory(
          category: 'Battery',
          type: DropDownItemType.header,
          icon: const SvgIcon(icon: AppVectors.package, height: 15)),
      _CatalogCategory(
          category: 'Jet Battery',
          type: DropDownItemType.data,
          icon: const SvgIcon(icon: AppVectors.package, height: 15)),
      _CatalogCategory(
          category: 'Lead Acid Batteries',
          type: DropDownItemType.data,
          icon: const SvgIcon(icon: AppVectors.package, height: 15)),
      _CatalogCategory(
          category: 'AGM Batteries',
          type: DropDownItemType.data,
          icon: const SvgIcon(icon: AppVectors.package, height: 15)),
      _CatalogCategory(
          category: 'EFB Batteries',
          type: DropDownItemType.data,
          icon: const SvgIcon(icon: AppVectors.package, height: 15))
    ];
  }
}

class _CatalogCategory {
  final String category;
  final DropDownItemType type;
  final SvgIcon icon;

  _CatalogCategory(
      {required this.category, required this.type, required this.icon});
}
