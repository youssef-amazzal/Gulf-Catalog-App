import 'package:flutter/material.dart';
import 'package:gulf_catalog_app/common/widgets/drop_down.dart';
import 'package:gulf_catalog_app/common/widgets/labeled_widget.dart';
import 'package:gulf_catalog_app/core/configs/theme/app_theme.dart';

class VehicleSectorFilter extends StatelessWidget {
  const VehicleSectorFilter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dropDownController = DropDownController<String>();
    final theme = context.theme;
    return LabeledWidget(
      label: "VEHICLE SECTOR",
      child: DropDown(
        controller: dropDownController,
        hintText: 'All Sectors',
        hintIcon: Icons.account_balance,
        items: _getSectors(),
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

  List<String> _getSectors() {
    return ['Automobile', 'Agriculture', 'Public Works', 'Transport'];
  }
}
