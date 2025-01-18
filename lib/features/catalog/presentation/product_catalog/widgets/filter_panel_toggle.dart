import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gulf_catalog_app/core/configs/routes/app_routes.dart';
import 'package:gulf_catalog_app/core/configs/theme/app_theme.dart';
import 'package:gulf_catalog_app/core/configs/theme/new/app_theme.dart';
import 'package:gulf_catalog_app/core/extensions/responsive/responsive.dart';
import 'package:gulf_catalog_app/features/catalog/presentation/bloc/ui/FilterPanel/filter_panel_cubit.dart';

class FilterPanelToggle extends StatelessWidget {
  const FilterPanelToggle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final colorScheme = theme.colorScheme;
    return BlocBuilder<FilterPanelCubit, FilterPanelState>(
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            color: colorScheme.primary,
            borderRadius: MAppTheme.kRadius,
          ),
          child: IconButton(
            onPressed: context.responsive(
              () => context.pushNamed(AppRoutes.filters.name),
              lg: () => context.read<FilterPanelCubit>().toggleVisibility(),
            ),
            icon: Icon(
              Icons.filter_alt_outlined,
              color: colorScheme.onPrimary,
            ),
          ),
        );
      },
    );
  }
}
