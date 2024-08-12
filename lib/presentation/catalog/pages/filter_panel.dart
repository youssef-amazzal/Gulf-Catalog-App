import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gulf_catalog_app/common/widgets/svg_icon.dart';
import 'package:gulf_catalog_app/core/configs/assets/app_vectors.dart';
import 'package:gulf_catalog_app/core/configs/theme/app_theme.dart';
import 'package:gulf_catalog_app/common/widgets/drop_down.dart';

class FilterPanel extends StatelessWidget {
  const FilterPanel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData theme = context.theme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Catalog',
              style: theme.appTextStyles.h1,
            ),
            const Gap(10),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              decoration: BoxDecoration(
                border: Border.all(color: theme.appColors.border, width: 2),
                borderRadius: BorderRadius.circular(100),
              ),
              child: RichText(
                text: TextSpan(
                  text: '2984 ',
                  style: theme.appTextStyles.body1.copyWith(fontSize: 14),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'total products',
                        style: theme.appTextStyles.bodyAlt1
                            .copyWith(fontSize: 13)),
                  ],
                ),
              ),
            ),
          ],
        ),
        const Gap(20),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            decoration: BoxDecoration(
              color: theme.appColors.surface1,
              borderRadius: BorderRadius.circular(16),
            ),
            width: 300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "PRODUCT STATUS",
                  style: theme.appTextStyles.bodyAlt1.copyWith(fontSize: 12),
                ),
                const Gap(30),
                Text(
                  "CATEGORY",
                  style: theme.appTextStyles.bodyAlt1.copyWith(fontSize: 12),
                ),
                const Gap(5),
                DropDown<CatalogCategory>(
                  hintText: 'All Categories',
                  hintIcon: Icons.category_rounded,
                  items: getCategories(),
                  itemBuilder: (item) => DropdownMenuItem(
                    value: item,
                    enabled: item.type == DropDownItemType.data,
                    child: item.type == DropDownItemType.header
                        ? Text(
                            item.category,
                            style: theme.appTextStyles.body1
                                .copyWith(fontSize: 13),
                            overflow: TextOverflow.ellipsis,
                          )
                        : Row(
                            children: [
                              const Gap(20),
                              Expanded(
                                child: Text(
                                  item.category,
                                  style: theme.appTextStyles.body1.copyWith(
                                      fontSize: 13,
                                      fontWeight: FontWeight.normal),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                  ),
                ),
                const Gap(20),
                Text(
                  "SORT BY",
                  style: theme.appTextStyles.bodyAlt1.copyWith(fontSize: 12),
                ),
                const Gap(5),
                DropDown(
                  hintText: 'Sort By',
                  hintIcon: Icons.sort,
                  items: getSortOptions(),
                  itemBuilder: (item) => DropdownMenuItem(
                    value: item,
                    child: Text(item,
                        style: theme.appTextStyles.body1.copyWith(fontSize: 13),
                        overflow: TextOverflow.ellipsis),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

List<String> getSortOptions() {
  return [
    'Alphabetically: A-Z',
    'Alphabetically: Z-A',
    'Quntity: High - Low',
    'Quntity: Low - High',
    'Price: High - Low',
    'Price: Low - High'
  ];
}

List<CatalogCategory> getCategories() {
  return [
    CatalogCategory(
        category: 'Engine Maintenance',
        type: DropDownItemType.header,
        icon: const SvgIcon(icon: AppVectors.package, height: 15)),
    CatalogCategory(
        category: 'Filters',
        type: DropDownItemType.data,
        icon: const SvgIcon(icon: AppVectors.package, height: 15)),
    CatalogCategory(
        category: 'Additives',
        type: DropDownItemType.data,
        icon: const SvgIcon(icon: AppVectors.package, height: 15)),
    CatalogCategory(
        category: 'Lubricants',
        type: DropDownItemType.data,
        icon: const SvgIcon(icon: AppVectors.package, height: 15)),
    CatalogCategory(
        category: 'Braking System',
        type: DropDownItemType.header,
        icon: const SvgIcon(icon: AppVectors.package, height: 15)),
    CatalogCategory(
        category: 'Brake Discs',
        type: DropDownItemType.data,
        icon: const SvgIcon(icon: AppVectors.package, height: 15)),
    CatalogCategory(
        category: 'Brake Shoes',
        type: DropDownItemType.data,
        icon: const SvgIcon(icon: AppVectors.package, height: 15)),
    CatalogCategory(
        category: 'Brake Pads',
        type: DropDownItemType.data,
        icon: const SvgIcon(icon: AppVectors.package, height: 15)),
    CatalogCategory(
        category: 'Wear Indicators',
        type: DropDownItemType.data,
        icon: const SvgIcon(icon: AppVectors.package, height: 15)),
    CatalogCategory(
        category: 'Wheel Cylinders',
        type: DropDownItemType.data,
        icon: const SvgIcon(icon: AppVectors.package, height: 15)),
    CatalogCategory(
        category: 'Brake Master Cylinders',
        type: DropDownItemType.data,
        icon: const SvgIcon(icon: AppVectors.package, height: 15)),
    CatalogCategory(
        category: 'Clutch System',
        type: DropDownItemType.header,
        icon: const SvgIcon(icon: AppVectors.package, height: 15)),
    CatalogCategory(
        category: 'Clutch Master Cylinders',
        type: DropDownItemType.data,
        icon: const SvgIcon(icon: AppVectors.package, height: 15)),
    CatalogCategory(
        category: 'Clutch Slave Cylinders',
        type: DropDownItemType.data,
        icon: const SvgIcon(icon: AppVectors.package, height: 15)),
    CatalogCategory(
        category: 'Clutch Release Bearings',
        type: DropDownItemType.data,
        icon: const SvgIcon(icon: AppVectors.package, height: 15)),
    CatalogCategory(
        category: 'Suspension System',
        type: DropDownItemType.header,
        icon: const SvgIcon(icon: AppVectors.package, height: 15)),
    CatalogCategory(
        category: 'Shock Absorbers',
        type: DropDownItemType.data,
        icon: const SvgIcon(icon: AppVectors.package, height: 15)),
    CatalogCategory(
        category: 'Axle Suspension',
        type: DropDownItemType.data,
        icon: const SvgIcon(icon: AppVectors.package, height: 15)),
    CatalogCategory(
        category: 'Wheel Bearings',
        type: DropDownItemType.data,
        icon: const SvgIcon(icon: AppVectors.package, height: 15)),
    CatalogCategory(
        category: 'Timing and Drive',
        type: DropDownItemType.header,
        icon: const SvgIcon(icon: AppVectors.package, height: 15)),
    CatalogCategory(
        category: 'Timing Belts',
        type: DropDownItemType.data,
        icon: const SvgIcon(icon: AppVectors.package, height: 15)),
    CatalogCategory(
        category: 'Timing Kits',
        type: DropDownItemType.data,
        icon: const SvgIcon(icon: AppVectors.package, height: 15)),
    CatalogCategory(
        category: 'Timing Chains',
        type: DropDownItemType.data,
        icon: const SvgIcon(icon: AppVectors.package, height: 15)),
    CatalogCategory(
        category: 'Cooling System',
        type: DropDownItemType.header,
        icon: const SvgIcon(icon: AppVectors.package, height: 15)),
    CatalogCategory(
        category: 'Water Pumps',
        type: DropDownItemType.data,
        icon: const SvgIcon(icon: AppVectors.package, height: 15)),
    CatalogCategory(
        category: 'Radiator Fans',
        type: DropDownItemType.data,
        icon: const SvgIcon(icon: AppVectors.package, height: 15)),
    CatalogCategory(
        category: 'Radiators',
        type: DropDownItemType.data,
        icon: const SvgIcon(icon: AppVectors.package, height: 15)),
    CatalogCategory(
        category: 'Coolants',
        type: DropDownItemType.data,
        icon: const SvgIcon(icon: AppVectors.package, height: 15)),
    CatalogCategory(
        category: 'Battery',
        type: DropDownItemType.header,
        icon: const SvgIcon(icon: AppVectors.package, height: 15)),
    CatalogCategory(
        category: 'Jet Battery',
        type: DropDownItemType.data,
        icon: const SvgIcon(icon: AppVectors.package, height: 15)),
    CatalogCategory(
        category: 'Lead Acid Batteries',
        type: DropDownItemType.data,
        icon: const SvgIcon(icon: AppVectors.package, height: 15)),
    CatalogCategory(
        category: 'AGM Batteries',
        type: DropDownItemType.data,
        icon: const SvgIcon(icon: AppVectors.package, height: 15)),
    CatalogCategory(
        category: 'EFB Batteries',
        type: DropDownItemType.data,
        icon: const SvgIcon(icon: AppVectors.package, height: 15))
  ];
}

class CatalogCategory {
  final String category;
  final DropDownItemType type;
  final SvgIcon icon;

  CatalogCategory(
      {required this.category, required this.type, required this.icon});
}
