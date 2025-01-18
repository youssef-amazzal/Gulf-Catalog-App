import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:gulf_catalog_app/core/configs/theme/app_theme.dart';
import 'package:gulf_catalog_app/core/extensions/responsive/responsive.dart';
import 'package:gulf_catalog_app/features/catalog/presentation/bloc/catalog/catalog_bloc.dart';
import 'package:gulf_catalog_app/features/catalog/presentation/i18n/catalog.i18n.dart';

class ResetButton extends StatelessWidget {
  const ResetButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    return Container(
      decoration: BoxDecoration(
        color: colorScheme.inverseSurface,
      ),
      child: ElevatedButton(
        onPressed: () {
          context.read<CatalogBloc>().add(CatalogReset());
        },
        style: ElevatedButton.styleFrom(
          overlayColor: colorScheme.onInverseSurface,
        ),
        child: Padding(
          padding: EdgeInsets.all(context.responsive(16, xl: 24)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.restart_alt_rounded,
                color: colorScheme.onInverseSurface,
                size: context.responsive(20, xl: 24),
              ),
              const Gap(10),
              Text(
                'reset_filters'.i18n,
                style: context.responsive(
                  textTheme.labelLarge!.copyWith(
                    color: colorScheme.onInverseSurface,
                  ),
                  xl: textTheme.titleMedium!.copyWith(
                    color: colorScheme.onInverseSurface,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
