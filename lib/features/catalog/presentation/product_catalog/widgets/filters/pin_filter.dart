import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_button/group_button.dart';
import 'package:gulf_catalog_app/common/widgets/labeled_widget.dart';
import 'package:gulf_catalog_app/core/configs/theme/app_theme.dart';

import 'package:gulf_catalog_app/common/models/my_group_button_options.dart';
import 'package:gulf_catalog_app/features/catalog/presentation/bloc/filter/filter_cubit.dart';

class PinFilter extends StatelessWidget {
  const PinFilter({
    super.key,
    required this.options,
  });

  final List<MyPinButtonOptions> options;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    GroupButtonController controller = GroupButtonController();

    return LabeledWidget(
      label: "PINNED PRODUCTS",
      child: BlocListener<FilterCubit, FilterState>(
        listener: (context, state) {
          if (state is FilteredState) {
            final pinState = state.pinState;
            if (pinState == null) {
              controller.unselectAll();
            } else {
              controller.selectIndex(
                  options.indexWhere((option) => option.pinState == pinState));
            }
          }
        },
        child: GroupButton<MyPinButtonOptions>(
          controller: controller,
          buttons: options,
          onSelected: (value, index, isSelected) {
            context.read<FilterCubit>().filter((currentState, emit) {
              final newState = currentState.copyWith(
                pinState: value.pinState,
              );
              emit(newState);
            });
          },
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
      ),
    );
  }
}
