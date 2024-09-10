import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gulf_catalog_app/common/widgets/drop_down.dart';
import 'package:gulf_catalog_app/common/widgets/labeled_widget.dart';
import 'package:gulf_catalog_app/core/configs/theme/app_theme.dart';
import 'package:gulf_catalog_app/features/catalog/presentation/bloc/filter/filter_cubit.dart';

class SortOptionFilter extends StatelessWidget {
  const SortOptionFilter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final dropDownController = DropDownController<SortOption>();

    return LabeledWidget(
      label: "SORT BY",
      child: BlocListener<FilterCubit, FilterState>(
        listener: (context, state) {
          if (state is FilteredState && state.sortBy == null) {
            dropDownController.setSelectedValue(null);
          }
        },
        child: DropDown<SortOption>(
          controller: dropDownController,
          hintText: 'Sort By',
          hintIcon: Icons.sort,
          items: _getSortOptions(),
          onChanged: (selected) {
            context.read<FilterCubit>().filter((currentState, emit) {
              final newState = currentState.copyWith(sortBy: selected!.value);
              emit(newState);
            });
          },
          itemBuilder: (item) => DropdownMenuItem(
            value: item,
            child: Text(item.label,
                style: theme.appTextStyles.body1
                    .copyWith(fontSize: 13, fontWeight: FontWeight.normal),
                overflow: TextOverflow.ellipsis),
          ),
        ),
      ),
    );
  }

  List<SortOption> _getSortOptions() {
    return [
      SortOption(value: SortBy.alphaAsc, label: 'Alphabetically: A-Z'),
      SortOption(value: SortBy.alphaDesc, label: 'Alphabetically: Z-A'),
      SortOption(value: SortBy.stockAsc, label: 'Quantity: Low - High'),
      SortOption(value: SortBy.stockDesc, label: 'Quantity: High - Low'),
      SortOption(value: SortBy.priceAsc, label: 'Price: Low - High'),
      SortOption(value: SortBy.priceDesc, label: 'Price: High - Low'),
      SortOption(value: SortBy.updatedAsc, label: 'Updated: Old - New'),
      SortOption(value: SortBy.updatedDesc, label: 'Updated: New - Old'),
    ];
    // return [
    //   'Alphabetically: A-Z',
    //   'Alphabetically: Z-A',
    //   'Quantity: High - Low',
    //   'Quantity: Low - High',
    //   'Price: High - Low',
    //   'Price: Low - High'
    // ];
  }
}

class SortOption {
  final SortBy value;
  final String label;

  SortOption({required this.value, required this.label});
}
