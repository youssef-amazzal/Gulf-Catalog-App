import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gulf_catalog_app/common/widgets/drop_down.dart';
import 'package:gulf_catalog_app/common/widgets/labeled_widget.dart';
import 'package:gulf_catalog_app/common/widgets/svg_icon.dart';
import 'package:gulf_catalog_app/core/configs/assets/app_vectors.dart';
import 'package:gulf_catalog_app/core/configs/theme/app_theme.dart';
import 'package:gulf_catalog_app/features/catalog/presentation/bloc/filter/filter_cubit.dart';
import 'package:gulf_catalog_app/features/catalog/presentation/i18n/categories.i18n.dart';

class CategoryFilter extends StatelessWidget {
  const CategoryFilter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final dropDownController = DropDownController<CategoryOption>();

    return LabeledWidget(
      label: "CATEGORY",
      child: BlocListener<FilterCubit, FilterState>(
        listener: (context, state) {
          if (state is FilteredState && state.category == null) {
            dropDownController.setSelectedValue(null);
          }
        },
        child: DropDown<CategoryOption>(
          controller: dropDownController,
          onChanged: (selected) {
            context.read<FilterCubit>().filter((currentState, emit) {
              final newState = currentState.copyWith(category: selected!.name);
              emit(newState);
            });
          },
          hintText: 'All Categories',
          hintIcon: Icons.category_rounded,
          items: _getCategories(),
          itemBuilder: (item) => DropdownMenuItem(
            value: item,
            enabled: item.type == DropDownItemType.data,
            child: item.type == DropDownItemType.header
                ? Text(
                    item.name,
                    style: theme.appTextStyles.body1.copyWith(fontSize: 13),
                    overflow: TextOverflow.ellipsis,
                  )
                : Row(
                    children: [
                      const Gap(20),
                      Expanded(
                        child: Text(
                          item.name.i18n,
                          style: theme.appTextStyles.body1.copyWith(
                              fontSize: 13, fontWeight: FontWeight.normal),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
          ),
          onSearch: (item, query) {
            return item.value!.type == DropDownItemType.header ||
                item.value!.name.i18n
                    .toLowerCase()
                    .contains(query.toLowerCase());
          },
        ),
      ),
    );
  }

  List<CategoryOption> _getCategories() {
    return [
      CategoryOption(
        name: 'Engine Maintenance',
        type: DropDownItemType.header,
        icon: const SvgIcon(icon: AppVectors.package, height: 15),
      ),
      ...categoryMapping['Engine Maintenance']!.map(
        (item) => CategoryOption(
          name: item,
          type: DropDownItemType.data,
          icon: const SvgIcon(icon: AppVectors.package, height: 15),
        ),
      ),
      CategoryOption(
        name: 'Timing and Drive',
        type: DropDownItemType.header,
        icon: const SvgIcon(icon: AppVectors.package, height: 15),
      ),
      ...categoryMapping['Timing and Drive']!.map(
        (item) => CategoryOption(
          name: item,
          type: DropDownItemType.data,
          icon: const SvgIcon(icon: AppVectors.package, height: 15),
        ),
      ),
      CategoryOption(
        name: 'Clutch System',
        type: DropDownItemType.header,
        icon: const SvgIcon(icon: AppVectors.package, height: 15),
      ),
      ...categoryMapping['Clutch System']!.map(
        (item) => CategoryOption(
          name: item,
          type: DropDownItemType.data,
          icon: const SvgIcon(icon: AppVectors.package, height: 15),
        ),
      ),
      CategoryOption(
        name: 'Suspension System',
        type: DropDownItemType.header,
        icon: const SvgIcon(icon: AppVectors.package, height: 15),
      ),
      ...categoryMapping['Suspension System']!.map(
        (item) => CategoryOption(
          name: item,
          type: DropDownItemType.data,
          icon: const SvgIcon(icon: AppVectors.package, height: 15),
        ),
      ),
      CategoryOption(
        name: 'Cooling System',
        type: DropDownItemType.header,
        icon: const SvgIcon(icon: AppVectors.package, height: 15),
      ),
      ...categoryMapping['Cooling System']!.map(
        (item) => CategoryOption(
          name: item,
          type: DropDownItemType.data,
          icon: const SvgIcon(icon: AppVectors.package, height: 15),
        ),
      ),
      CategoryOption(
        name: 'Braking System',
        type: DropDownItemType.header,
        icon: const SvgIcon(icon: AppVectors.package, height: 15),
      ),
      ...categoryMapping['Braking System']!.map(
        (item) => CategoryOption(
          name: item,
          type: DropDownItemType.data,
          icon: const SvgIcon(icon: AppVectors.package, height: 15),
        ),
      ),
      CategoryOption(
        name: 'Battery',
        type: DropDownItemType.header,
        icon: const SvgIcon(icon: AppVectors.package, height: 15),
      ),
      ...categoryMapping['Battery']!.map(
        (item) => CategoryOption(
          name: item,
          type: DropDownItemType.data,
          icon: const SvgIcon(icon: AppVectors.package, height: 15),
        ),
      ),
    ];
  }
}

const categoryMapping = {
  'Engine Maintenance': [
    'additive',
    'lubrifiant',
    'filter_air',
    'filter_carburant',
    'filter_huile',
    'filter_habitacle',
    'filter_dessiccateur',
    'filter_liquide',
    'filter_hydraulique'
  ],
  'Timing and Drive': ['courroie', 'kit_courroie', 'kit_chain'],
  'Clutch System': [
    'butee_hydraulique',
    'cylindre_recepteur',
    'cylindre_emetteur',
    'maitre_cylindre_embrayage'
  ],
  'Suspension System': ['amortisseur', 'roulement_roue'],
  'Cooling System': ['radiateur', 'pompe_eau'],
  'Battery': ['battery'],
  'Braking System': [
    'machoire_frein',
    'plaquette',
    'maitre_cylindre',
    'cylindre_roue',
    'disque',
    'indicateur_usure'
  ],
};

class CategoryOption {
  final String name;
  final DropDownItemType type;
  // final int value;
  final SvgIcon? icon;

  CategoryOption({
    required this.name,
    required this.type,
    // required this.value,
    this.icon,
  });
}
