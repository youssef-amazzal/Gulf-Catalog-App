import 'package:flutter/material.dart';
import 'package:gulf_catalog_app/common/widgets/drop_down.dart';
import 'package:gulf_catalog_app/common/widgets/labeled_widget.dart';
import 'package:gulf_catalog_app/core/configs/theme/app_theme.dart';

class VehicleModelFilter extends StatelessWidget {
  const VehicleModelFilter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return LabeledWidget(
      label: "VEHICLE MODEL",
      child: DropDown<String>(
        hintText: 'All Models',
        hintIcon: Icons.directions_car,
        items: null,
        itemBuilder: (item) => DropdownMenuItem(
          value: item,
          child: Text(item,
              style: theme.appTextStyles.body1
                  .copyWith(fontSize: 13, fontWeight: FontWeight.normal),
              overflow: TextOverflow.ellipsis),
        ),
      ),
    );
  }
}
