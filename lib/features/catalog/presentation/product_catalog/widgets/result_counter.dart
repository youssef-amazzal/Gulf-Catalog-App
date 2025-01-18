import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gulf_catalog_app/core/configs/theme/app_theme.dart';
import 'package:gulf_catalog_app/core/extensions/responsive/responsive.dart';
import 'package:gulf_catalog_app/features/catalog/presentation/bloc/catalog/catalog_bloc.dart';
import 'package:gulf_catalog_app/features/catalog/presentation/i18n/catalog.i18n.dart';

class ResultCounter extends StatelessWidget {
  const ResultCounter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 7,
        horizontal: context.responsive(15, xl: 20),
      ),
      height: context.responsive<double>(40, xl: 50),
      decoration: BoxDecoration(
        color: colorScheme.primary.withOpacity(0.15),
        // border: Border.all(color: colorScheme.outline),
        borderRadius: BorderRadius.circular(100),
      ),
      child: BlocBuilder<CatalogBloc, CatalogState>(
        builder: (context, state) {
          int total = 0;
          if (state is CatalogSuccess) {
            total = state.products.length;
          }
          return Center(
            child: RichText(
              text: TextSpan(
                text: '$total ',
                style: context.responsive(
                  textTheme.labelMedium!.copyWith(color: colorScheme.primary),
                  xl: textTheme.labelLarge!
                      .copyWith(color: colorScheme.primary),
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: 'total_products'.i18n,
                    style: context.responsive(
                      textTheme.labelSmall!.copyWith(
                        color: colorScheme.primary,
                      ),
                      xl: textTheme.labelMedium!.copyWith(
                        color: colorScheme.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
