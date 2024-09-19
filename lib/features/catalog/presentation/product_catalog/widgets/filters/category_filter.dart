import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gulf_catalog_app/common/widgets/drop_down.dart';
import 'package:gulf_catalog_app/common/widgets/labeled_widget.dart';
import 'package:gulf_catalog_app/common/widgets/svg_icon.dart';
import 'package:gulf_catalog_app/core/configs/assets/app_vectors.dart';
import 'package:gulf_catalog_app/core/configs/theme/app_theme.dart';
import 'package:gulf_catalog_app/core/extensions/responsive/responsive.dart';
import 'package:gulf_catalog_app/features/catalog/catalog.dart';
import 'package:gulf_catalog_app/features/catalog/presentation/i18n/catalog.i18n.dart';

class CategoryFilter extends StatelessWidget {
  const CategoryFilter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    final dropDownController = DropDownController<CategoryOption>();

    return LabeledWidget(
      label: "category_label",
      child: BlocListener<CatalogBloc, CatalogState>(
        listener: (context, state) {
          if (state is CatalogInitial || state is CatalogResetState) {
            dropDownController.setSelectedValue(null);
          }
        },
        child: DropDown<CategoryOption>(
          controller: dropDownController,
          onChanged: (selected) {
            context.read<CatalogBloc>().filter(category: selected?.name);
          },
          hintText: 'category_hint'.i18n,
          hintIcon: Icons.category_rounded,
          items: _getCategories(),
          itemBuilder: (item) => DropdownMenuItem(
            value: item,
            enabled: item.type == DropDownItemType.data,
            child: item.type == DropDownItemType.header
                ? Text(
                    item.name.i18n,
                    style: context.responsive(
                      textTheme.labelMedium,
                      xl: textTheme.labelLarge,
                    ),
                    overflow: TextOverflow.ellipsis,
                  )
                : Row(
                    children: [
                      const Gap(10),
                      Expanded(
                        child: Text(
                          item.name.i18n,
                          style: context.responsive(
                            textTheme.bodyMedium,
                            xl: textTheme.bodyLarge,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }

  List<CategoryOption> _getCategories() {
    return [
      CategoryOption(
        name: 'Engine Maintenance',
        type: DropDownItemType.header,
        icon: const SvgIcon(icon: AppVectors.solidPackage, height: 15),
      ),
      ...categoryMapping['Engine Maintenance']!.map(
        (item) => CategoryOption(
          name: item,
          type: DropDownItemType.data,
          icon: const SvgIcon(icon: AppVectors.solidPackage, height: 15),
        ),
      ),
      CategoryOption(
        name: 'Timing and Drive',
        type: DropDownItemType.header,
        icon: const SvgIcon(icon: AppVectors.solidPackage, height: 15),
      ),
      ...categoryMapping['Timing and Drive']!.map(
        (item) => CategoryOption(
          name: item,
          type: DropDownItemType.data,
          icon: const SvgIcon(icon: AppVectors.solidPackage, height: 15),
        ),
      ),
      CategoryOption(
        name: 'Clutch System',
        type: DropDownItemType.header,
        icon: const SvgIcon(icon: AppVectors.solidPackage, height: 15),
      ),
      ...categoryMapping['Clutch System']!.map(
        (item) => CategoryOption(
          name: item,
          type: DropDownItemType.data,
          icon: const SvgIcon(icon: AppVectors.solidPackage, height: 15),
        ),
      ),
      CategoryOption(
        name: 'Suspension System',
        type: DropDownItemType.header,
        icon: const SvgIcon(icon: AppVectors.solidPackage, height: 15),
      ),
      ...categoryMapping['Suspension System']!.map(
        (item) => CategoryOption(
          name: item,
          type: DropDownItemType.data,
          icon: const SvgIcon(icon: AppVectors.solidPackage, height: 15),
        ),
      ),
      CategoryOption(
        name: 'Cooling System',
        type: DropDownItemType.header,
        icon: const SvgIcon(icon: AppVectors.solidPackage, height: 15),
      ),
      ...categoryMapping['Cooling System']!.map(
        (item) => CategoryOption(
          name: item,
          type: DropDownItemType.data,
          icon: const SvgIcon(icon: AppVectors.solidPackage, height: 15),
        ),
      ),
      CategoryOption(
        name: 'Braking System',
        type: DropDownItemType.header,
        icon: const SvgIcon(icon: AppVectors.solidPackage, height: 15),
      ),
      ...categoryMapping['Braking System']!.map(
        (item) => CategoryOption(
          name: item,
          type: DropDownItemType.data,
          icon: const SvgIcon(icon: AppVectors.solidPackage, height: 15),
        ),
      ),
      CategoryOption(
        name: 'Battery',
        type: DropDownItemType.header,
        icon: const SvgIcon(icon: AppVectors.solidPackage, height: 15),
      ),
      ...categoryMapping['Battery']!.map(
        (item) => CategoryOption(
          name: item,
          type: DropDownItemType.data,
          icon: const SvgIcon(icon: AppVectors.solidPackage, height: 15),
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
