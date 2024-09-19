import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:gulf_catalog_app/core/configs/theme/app_theme.dart';
import 'package:gulf_catalog_app/features/catalog/catalog.dart';
import 'package:gulf_catalog_app/features/catalog/presentation/product_catalog/widgets/filters/category_filter.dart';
import 'package:gulf_catalog_app/features/catalog/presentation/product_catalog/widgets/filters/sort_option_filter.dart';
import 'package:gulf_catalog_app/features/catalog/presentation/product_catalog/widgets/filters/status_filter.dart';
import 'package:gulf_catalog_app/common/models/my_group_button_options.dart';

class FilterSection extends StatelessWidget {
  const FilterSection({
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
              padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 13),
              decoration: BoxDecoration(
                border: Border.all(color: theme.appColors.border, width: 2),
                borderRadius: BorderRadius.circular(100),
              ),
              child: BlocBuilder<CatalogBloc, CatalogState>(
                builder: (context, state) {
                  int total = 0;
                  if (state is CatalogSuccess) {
                    total = state.products.length;
                  }
                  return RichText(
                    text: TextSpan(
                      text: '$total ',
                      style: theme.appTextStyles.body1.copyWith(fontSize: 14),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'total products',
                            style: theme.appTextStyles.bodyAlt1
                                .copyWith(fontSize: 13.5)),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        const Gap(20),
        const Expanded(
          child: FilterPanel(),
        ),
      ],
    );
  }
}

class FilterPanel extends StatelessWidget {
  const FilterPanel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    const double panelWidth = 300;
    const double panelPadding = 15;
    const double statusButtonWidth = (panelWidth - panelPadding * 2 - 10) / 2;

    return Container(
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
              behavior:
                  ScrollConfiguration.of(context).copyWith(scrollbars: false),
              child: const SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      StatusFilter(
                        options: [
                          MyGroupButtonOptions(
                            label: "All",
                            width: double.infinity,
                            status: Availability.all,
                          ),
                          MyGroupButtonOptions(
                            label: "In Stock",
                            width: statusButtonWidth,
                            status: Availability.inStock,
                          ),
                          MyGroupButtonOptions(
                            label: "Out of Stock",
                            width: statusButtonWidth,
                            status: Availability.outOfStock,
                          ),
                        ],
                      ),
                      Gap(20),
                      CategoryFilter(),
                      Gap(20),
                      SortOptionFilter(),
                      // Gap(20),
                      // VehicleSectorFilter(),
                      // Gap(20),
                      // VehicleManufacturerFilter(),
                      // Gap(20),
                      // VehicleModelFilter(),
                      // Gap(20),
                      // VechicleSerieFilter(),
                    ],
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => context.read<CatalogBloc>().add(CatalogReset()),
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
    );
  }
}
