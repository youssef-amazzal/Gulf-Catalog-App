import 'package:flutter/material.dart';
import 'package:gulf_catalog_app/common/widgets/drop_down.dart';
import 'package:gulf_catalog_app/common/widgets/labeled_widget.dart';
import 'package:gulf_catalog_app/core/configs/theme/app_theme.dart';

class SortOptionFilter extends StatelessWidget {
  const SortOptionFilter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return LabeledWidget(
      label: "SORT BY",
      child: DropDown(
        hintText: 'Sort By',
        hintIcon: Icons.sort,
        items: _getSortOptions(),
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

  List<String> _getSortOptions() {
    return [
      'Alphabetically: A-Z',
      'Alphabetically: Z-A',
      'Quantity: High - Low',
      'Quantity: Low - High',
      'Price: High - Low',
      'Price: Low - High'
    ];
  }
}
