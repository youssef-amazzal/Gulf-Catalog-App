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
            mainAxisSize: MainAxisSize.min,
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
              child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: filterdData.length,
            itemBuilder: (context, index) {
              return Container(
                key: Key(filterdData[index].id.toString()),
                padding: const EdgeInsets.all(20),
                color: index % 2 == 0
                    ? theme.appColors.surface2
                    : theme.appColors.surface1,
                child: Row(
                  children: [
                    Text(
                      filterdData[index].name,
                      style: theme.appTextStyles.body1.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      filterdData[index].beginYearMonth != null
                          ? format.format(filterdData[index].beginYearMonth!)
                          : '',
                      style: theme.appTextStyles.body1.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              );
            },
          ))
        ],
      ),
    );
  }

  void _search(String? value) {
    setState(() {
      filterdData = widget.vehicles
          .where((element) =>
              element.name.toLowerCase().contains(value!.toLowerCase()))
          .toList();
    });
  }
}
