import 'package:flutter/material.dart';
import 'package:gulf_catalog_app/common/widgets/drop_down.dart';
import 'package:gulf_catalog_app/common/widgets/labeled_widget.dart';
import 'package:gulf_catalog_app/core/configs/theme/app_theme.dart';

class VechicleSerieFilter extends StatelessWidget {
  const VechicleSerieFilter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return LabeledWidget(
      label: "VEHICLE SERIE",
      child: DropDown<String>(
        hintText: 'All Series',
        hintIcon: Icons.calendar_month,
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
