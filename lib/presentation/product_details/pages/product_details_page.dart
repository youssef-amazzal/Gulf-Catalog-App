import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:group_button/group_button.dart';
import 'package:gulf_catalog_app/core/configs/theme/app_theme.dart';

import 'package:gulf_catalog_app/presentation/product_details/widgets/carousel.dart';
import 'package:gulf_catalog_app/presentation/product_details/widgets/compatible_vehicles/compatible_vehicles_panel.dart';
import 'package:gulf_catalog_app/presentation/product_details/widgets/cross_references/cross_refs_panel.dart';
import 'package:gulf_catalog_app/presentation/product_details/widgets/general_information/general_information_panel.dart';
import 'package:gulf_catalog_app/presentation/product_details/widgets/title_bar.dart';
import 'package:gulf_catalog_app/presentation/product_details/widgets/tool_bar.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Scaffold(
      body: Container(
        color: theme.appColors.background,
        child: const SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: EdgeInsets.all(40),
            child: Column(
              children: [
                ToolBar(),
                Gap(25),
                TitleBar(),
                Gap(25),
                IntrinsicHeight(
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                            width: 450,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Carousel(),
                                // Gap(40),
                              ],
                            )),
                        Gap(25),
                        Expanded(child: GeneralInformationPanel()),
                      ]),
                ),
                Gap(25),
                SizedBox(
                  width: double.infinity,
                  height: 600,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(width: 450, child: CrossRefsPanel()),
                      Gap(25),
                      Expanded(
                        child: CompatibleVehiclesPanel(),
                      )
                    ],
                  ),
                )
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
