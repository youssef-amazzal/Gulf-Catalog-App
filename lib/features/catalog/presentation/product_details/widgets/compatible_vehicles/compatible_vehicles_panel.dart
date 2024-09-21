import 'package:gulf_catalog_app/core/extensions/responsive/responsive.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:gulf_catalog_app/features/catalog/presentation/i18n/catalog.i18n.dart';
import 'package:gulf_catalog_app/core/configs/theme/app_theme.dart';
import 'package:gulf_catalog_app/features/catalog/domain/entities/vehicle.dart';
import 'package:gulf_catalog_app/features/catalog/presentation/product_details/widgets/panel.dart';
import 'package:gulf_catalog_app/features/catalog/presentation/product_details/widgets/panel_search_bar.dart';

class CompatibleVehiclesPanel extends StatefulWidget {
  final List<Vehicle> vehicles;
  const CompatibleVehiclesPanel({
    super.key,
    required this.vehicles,
  });

  @override
  State<CompatibleVehiclesPanel> createState() =>
      _CompatibleVehiclesPanelState();
}

class _CompatibleVehiclesPanelState extends State<CompatibleVehiclesPanel> {
  List<Vehicle> filterdData = [];

  @override
  void initState() {
    super.initState();
    filterdData = List.from(widget.vehicles)
      ..sort((a, b) => a.name.compareTo(b.name));
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    final format = DateFormat('yyyy-MM');

    return Panel(
      title: 'compatible_vehicles'.i18n,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: PanelSearchBar(
                  hintText: "search_hint".i18n,
                  onChanged: _search,
                ),
              )
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SizedBox(
                width: context.responsive(800, xl: 900),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 20,
                      ),
                      decoration: BoxDecoration(
                        color: colorScheme.surface,
                        border: Border.symmetric(
                          horizontal: BorderSide(
                            color: colorScheme.outline.withOpacity(0.3),
                            width: 0.5,
                          ),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          _Cell(
                              flex: 5,
                              alignment: Alignment.centerLeft,
                              text: 'vehicle'.i18n),
                          _Cell(text: 'hp'.i18n),
                          _Cell(flex: 2, text: 'capacity_cc'.i18n),
                          _Cell(flex: 3, text: 'engine'.i18n),
                          _Cell(flex: 2, text: 'begin_year_month'.i18n),
                          _Cell(flex: 2, text: 'end_year_month'.i18n),
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: filterdData.length,
                        itemBuilder: (context, index) {
                          return Container(
                            key: Key(filterdData[index].id.toString()),
                            padding: const EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 20,
                            ),
                            decoration: BoxDecoration(
                              color: index % 2 == 0
                                  ? colorScheme.surfaceDim.withOpacity(0.3)
                                  : colorScheme.surface,
                              border: Border.symmetric(
                                horizontal: BorderSide(
                                  color: colorScheme.outline.withOpacity(0.3),
                                  width: 0.5,
                                ),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                _Cell(
                                  flex: 5,
                                  alignment: Alignment.centerLeft,
                                  text: filterdData[index].name.toString(),
                                ),
                                _Cell(
                                  text:
                                      filterdData[index].hp?.toString() ?? "-",
                                ),
                                _Cell(
                                  flex: 2,
                                  text: filterdData[index]
                                          .capacityCc
                                          ?.toString() ??
                                      "-",
                                ),
                                _Cell(
                                  flex: 3,
                                  text: filterdData[index].engine?.toString() ??
                                      "-",
                                ),
                                _Cell(
                                  flex: 2,
                                  text: filterdData[index].beginYearMonth !=
                                          null
                                      ? format.format(
                                          filterdData[index].beginYearMonth!)
                                      : '-',
                                ),
                                _Cell(
                                  flex: 2,
                                  text: filterdData[index].endYearMonth != null
                                      ? format.format(
                                          filterdData[index].endYearMonth!)
                                      : '-',
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _search(String? value) {
    setState(() {
      filterdData = widget.vehicles
          .where((element) =>
              element.name.toLowerCase().contains(value!.toLowerCase()))
          .toList()
        ..sort((a, b) => a.name.compareTo(b.name));
    });
  }
}

class _Cell extends StatelessWidget {
  final String text;
  final int? flex;
  final Alignment? alignment;

  const _Cell({
    required this.text,
    this.flex,
    this.alignment,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final textTheme = theme.textTheme;

    return Flexible(
      flex: flex ?? 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Align(
          alignment: alignment ?? Alignment.center,
          child: Text(
            text,
            style: context.responsive(
              textTheme.bodySmall,
              xl: textTheme.bodyLarge,
            ),
          ),
        ),
      ),
    );
  }
}
