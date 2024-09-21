import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_button/group_button.dart';
import 'package:gulf_catalog_app/common/widgets/labeled_widget.dart';
import 'package:gulf_catalog_app/core/configs/theme/app_theme.dart';

import 'package:gulf_catalog_app/common/types/my_group_button_options.dart';
import 'package:gulf_catalog_app/core/extensions/responsive/responsive.dart';
import 'package:gulf_catalog_app/features/catalog/catalog.dart';

class LowRotationFilter extends StatelessWidget {
  const LowRotationFilter({
    super.key,
    required this.options,
  });

  final List<PlainButtonOptions> options;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    GroupButtonController controller = GroupButtonController();

    return LabeledWidget(
      label: "low_rotation_label",
      child: BlocListener<CatalogBloc, CatalogState>(
        listener: (context, state) {
          if (state is CatalogInitial || state is CatalogResetState) {
            controller.unselectAll();
          }
        },
        child: GroupButton<PlainButtonOptions>(
          controller: controller,
          options: const GroupButtonOptions(
            spacing: 5,
            runSpacing: 5,
          ),
          buttons: options,
          onSelected: (value, index, isSelected) {
            context.read<CatalogBloc>().filter(isLowRotated: true);
          },
          buttonBuilder: (isSelected, data, context) => Container(
            width: data.width,
            alignment: Alignment.center,
            padding: EdgeInsets.all(context.responsive(8, xl: 12)),
            decoration: BoxDecoration(
              color: isSelected
                  ? colorScheme.primary.withOpacity(0.2)
                  : colorScheme.surfaceDim,
              borderRadius: BorderRadius.circular(8),
              // border: Border.all(
              //     color:
              //         isSelected ? theme.appColors.accent : Colors.transparent,
              //     width: 2),
            ),
            child: Text(
              data.label,
              style: context.responsive(
                textTheme.labelMedium!.copyWith(
                  color: isSelected
                      ? colorScheme.primary
                      : colorScheme.onSurfaceVariant,
                ),
                xl: textTheme.labelLarge!.copyWith(
                  color: isSelected
                      ? colorScheme.primary
                      : colorScheme.onSurfaceVariant,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
