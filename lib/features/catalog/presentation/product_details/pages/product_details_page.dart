import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:group_button/group_button.dart';
import 'package:gulf_catalog_app/core/configs/theme/app_theme.dart';
import 'package:gulf_catalog_app/features/catalog/presentation/bloc/details/details_bloc.dart';

import 'package:gulf_catalog_app/features/catalog/presentation/product_details/widgets/carousel.dart';
import 'package:gulf_catalog_app/features/catalog/presentation/product_details/widgets/compatible_vehicles/compatible_vehicles_panel.dart';
import 'package:gulf_catalog_app/features/catalog/presentation/product_details/widgets/cross_references/cross_refs_panel.dart';
import 'package:gulf_catalog_app/features/catalog/presentation/product_details/widgets/general_information/general_information_panel.dart';
import 'package:gulf_catalog_app/features/catalog/presentation/product_details/widgets/title_bar.dart';
import 'package:gulf_catalog_app/features/catalog/presentation/product_details/widgets/tool_bar.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final ColorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Scaffold(
      body: Container(
        height: double.infinity,
        color: theme.appColors.background,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(40),
            child: Column(
              children: [
                const ToolBar(),
                const Gap(25),
                BlocConsumer<DetailsBloc, DetailsState>(
                  listener: (context, state) {
                    if (state is DetailsFailedFetching) {
                      print('Failed to fetch product: ${state.message}');
                    }
                  },
                  builder: (context, state) {
                    if (state is! DetailsSuccessfulFetching) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: theme.appColors.accent,
                        ),
                      );
                    }

                    final product = state.product;

                    return Column(
                      children: [
                        TitleBar(
                          title: product.reference ?? '',
                          category: product.category?.name ?? "",
                        ),
                        const Gap(25),
                        SizedBox(
                          height: 450,
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                    width: 450,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Carousel(
                                          images: product.images,
                                        ),
                                        // Gap(40),
                                      ],
                                    )),
                                const Gap(25),
                                Expanded(
                                  child:
                                      GeneralInformationPanel(product: product),
                                ),
                              ]),
                        ),
                        const Gap(25),
                        Builder(builder: (context) {
                          if (product.crossRefs.isEmpty &&
                              product.oeRefs.isEmpty &&
                              product.vehicles.isEmpty) {
                            return const SizedBox();
                          } else {
                            return SizedBox(
                              width: double.infinity,
                              height: 600,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                      width: 450,
                                      child: CrossRefsPanel(
                                        crossRefs: product.crossRefs,
                                        oeRefs: product.oeRefs,
                                      )),
                                  const Gap(25),
                                  Expanded(
                                    child: CompatibleVehiclesPanel(
                                      vehicles: product.vehicles,
                                    ),
                                  )
                                ],
                              ),
                            );
                          }
                        })
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ToggleSwitch extends StatefulWidget {
  const ToggleSwitch({
    super.key,
  });

  @override
  State<ToggleSwitch> createState() => _ToggleSwitchState();
}

class _ToggleSwitchState extends State<ToggleSwitch> {
  late GroupButtonController _controller;
  late int selectedIndex;

  @override
  void initState() {
    super.initState();
    _controller = GroupButtonController();
    _controller.selectIndex(0);
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          color: theme.appColors.onAccent,
          borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.all(2),
      child: GroupButton(
        controller: _controller,
        buttons: const ['Compatible Vehicles', 'Cross References'],
        options: const GroupButtonOptions(spacing: 0),
        buttonBuilder: (selected, value, context) {
          return Container(
            height: 50,
            width: 170,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color:
                    selected ? theme.appColors.accent.withOpacity(0.1) : null,
                borderRadius: BorderRadius.circular(10),
                border: Border(
                    top: BorderSide(
                        color: selected
                            ? theme.appColors.accent.withOpacity(0.15)
                            : theme.appColors.onAccent,
                        width: 2))),
            child: Center(
              child: Text(
                value,
                style: theme.appTextStyles.bodyAlt1.copyWith(
                    fontSize: 13,
                    color: selected
                        ? theme.appColors.accent
                        : theme.appColors.onSurfaceSecondary1),
              ),
            ),
          );
        },
      ),
    );
  }
}
