import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gulf_catalog_app/common/widgets/svg_icon.dart';
import 'package:gulf_catalog_app/core/configs/assets/app_vectors.dart';
import 'package:gulf_catalog_app/core/configs/theme/app_theme.dart';
import 'package:gulf_catalog_app/core/configs/theme/new/app_theme.dart';
import 'package:gulf_catalog_app/core/extensions/responsive/responsive.dart';
import 'package:gulf_catalog_app/features/catalog/presentation/bloc/catalog/catalog_bloc.dart';
import 'package:gulf_catalog_app/features/catalog/presentation/i18n/catalog.i18n.dart';

class MSearchBar extends StatefulWidget {
  const MSearchBar({
    super.key,
  });

  @override
  State<MSearchBar> createState() => _MSearchBarState();
}

class _MSearchBarState extends State<MSearchBar> {
  final controller = TextEditingController();
  String? query;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: MAppTheme.kRadius,
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: "search_hint".i18n,
                hintStyle: context.responsive(
                  textTheme.labelMedium!
                      .copyWith(color: colorScheme.onSurfaceVariant),
                  xl: textTheme.labelLarge!
                      .copyWith(color: colorScheme.onSurfaceVariant),
                ),
                suffixIcon: Builder(
                  builder: (context) {
                    if (query == null || query!.isEmpty) {
                      return const SizedBox(width: 50);
                    }
                    return IconButton(
                      onPressed: () => setState(() {
                        query = null;
                        controller.clear();
                        context
                            .read<CatalogBloc>()
                            .add(const CatalogFetchEvent());
                      }),
                      icon: Icon(Icons.close,
                          color: colorScheme.onSurfaceVariant),
                    );
                  },
                ),
              ),
              onChanged: (value) {
                setState(() {
                  query = value;
                });
              },
              onSubmitted: (value) {
                context
                    .read<CatalogBloc>()
                    .add(CatalogFetchEvent(reference: value));
              },
            ),
          ),
          Container(
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: MAppTheme.kRadius.topRight,
                bottomRight: MAppTheme.kRadius.bottomRight,
              ),
              color: colorScheme.inverseSurface,
            ),
            child: IconButton(
              onPressed: () {
                context
                    .read<CatalogBloc>()
                    .add(CatalogFetchEvent(reference: query));
              },
              icon: SvgIcon(
                icon: AppVectors.magnifier,
                height: context.responsive<double>(20, xl: 30),
                color: colorScheme.onInverseSurface,
              ),
            ),
          )
        ],
      ),
    );
  }
}
