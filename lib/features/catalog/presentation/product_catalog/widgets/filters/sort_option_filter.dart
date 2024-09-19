import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gulf_catalog_app/common/widgets/drop_down.dart';
import 'package:gulf_catalog_app/common/widgets/labeled_widget.dart';
import 'package:gulf_catalog_app/core/configs/theme/app_theme.dart';
import 'package:gulf_catalog_app/features/catalog/catalog.dart';
import 'package:gulf_catalog_app/features/catalog/presentation/i18n/catalog.i18n.dart';

class SortOptionFilter extends StatelessWidget {
  const SortOptionFilter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    final dropDownController = DropDownController<SortOption>();

    return LabeledWidget(
      label: "sort_by_label",
      child: BlocListener<CatalogBloc, CatalogState>(
        listener: (context, state) {
          if (state is CatalogInitial || state is CatalogResetState) {
            dropDownController.setSelectedValue(null);
          }
        },
        child: DropDown<SortOption>(
          controller: dropDownController,
          hintText: 'sort_by_hint'.i18n,
          hintIcon: Icons.sort,
          items: _getSortOptions(),
          onChanged: (selected) {
            context.read<CatalogBloc>().filter(sortBy: selected?.value);
          },
          itemBuilder: (item) => DropdownMenuItem(
            value: item,
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '${item.type.i18n}: ',
                    style: textTheme.labelMedium!.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                  TextSpan(
                    text: item.variant.i18n,
                    style: textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<SortOption> _getSortOptions() {
    return [
      (value: SortBy.alphaAsc, type: 'alphabetically', variant: 'a_z'),
      (value: SortBy.alphaDesc, type: 'alphabetically', variant: 'z_a'),
      (value: SortBy.stockAsc, type: 'quantity', variant: 'low_high'),
      (value: SortBy.stockDesc, type: 'quantity', variant: 'high_low'),
      (value: SortBy.priceAsc, type: 'price', variant: 'low_high'),
      (value: SortBy.priceDesc, type: 'price', variant: 'high_low'),
      (value: SortBy.updatedAsc, type: 'updated', variant: 'old_new'),
      (value: SortBy.updatedDesc, type: 'updated', variant: 'new_old'),
    ];
  }
}

typedef SortOption = ({SortBy value, String type, String variant});
