import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gulf_catalog_app/core/configs/theme/app_theme.dart';
import 'package:gulf_catalog_app/features/catalog/presentation/widgets/filters/category_filter.dart';
import 'package:gulf_catalog_app/features/catalog/presentation/widgets/filters/vechicle_serie_filter.dart';
import 'package:gulf_catalog_app/features/catalog/presentation/widgets/filters/vehicle_manufacturer_filter.dart';
import 'package:gulf_catalog_app/features/catalog/presentation/widgets/filters/vehicle_model_filter.dart';
import 'package:gulf_catalog_app/features/catalog/presentation/widgets/filters/sort_option_filter.dart';
import 'package:gulf_catalog_app/features/catalog/presentation/widgets/filters/status_filter.dart';
import 'package:gulf_catalog_app/features/catalog/presentation/widgets/filters/vehicle_sector_filter.dart';

import '../../../../common/models/my_group_button_options.dart';

class FilterPanel extends StatelessWidget {
  const FilterPanel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData theme = context.theme;
    const double panelWidth = 300;
    const double panelPadding = 15;
    const double statusButtonWidth = (panelWidth - panelPadding * 2 - 10) / 2;

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
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: theme.appColors.surface1,
              borderRadius: BorderRadius.circular(16),
            ),
            width: panelWidth,
            child: Column(
              children: [
                Expanded(
                  child: ScrollConfiguration(
                    behavior: ScrollConfiguration.of(context)
                        .copyWith(scrollbars: false),
                    child: const SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            StatusFilter(
                              options: [
                                MyGroupButtonOptions(
                                    label: "All", width: double.infinity),
                                MyGroupButtonOptions(
                                    label: "Available",
                                    width: statusButtonWidth),
                                MyGroupButtonOptions(
                                    label: "Out of Stock",
                                    width: statusButtonWidth),
                              ],
                            ),
                            Gap(20),
                            CategoryFilter(),
                            Gap(20),
                            SortOptionFilter(),
                            Gap(20),
                            VehicleSectorFilter(),
                            Gap(20),
                            VehicleManufacturerFilter(),
                            Gap(20),
                            VehicleModelFilter(),
                            Gap(20),
                            VechicleSerieFilter(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    color: theme.appColors.surface2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.restart_alt_rounded),
                        const Gap(10),
                        Text(
                          'Reset Filters',
                          style: theme.appTextStyles.body1,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
