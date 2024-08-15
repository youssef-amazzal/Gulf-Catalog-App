import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:gulf_catalog_app/common/widgets/labeled_widget.dart';
import 'package:gulf_catalog_app/core/configs/theme/app_theme.dart';

import '../../../../common/models/my_group_button_options.dart';

class StatusFilter extends StatelessWidget {
  const StatusFilter({
    super.key,
    required this.options,
  });

  final List<MyGroupButtonOptions> options;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return LabeledWidget(
      label: "PRODUCT STATUS",
      child: GroupButton<MyGroupButtonOptions>(
        buttons: options,
        buttonBuilder: (isSelected, data, context) => Container(
          width: data.width,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: isSelected
                ? theme.appColors.surface2
                : theme.appColors.surface1,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
                color: isSelected
                    ? theme.appColors.accent
                    : theme.appColors.border,
                width: 2),
          ),
          child: Text(
            data.label,
            style: theme.appTextStyles.body1.copyWith(
              fontSize: 13,
            ),
          ),
        ),
      ),
    );
  }
}
