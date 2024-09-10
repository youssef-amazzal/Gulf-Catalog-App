import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gulf_catalog_app/common/widgets/action_button/action_button.dart';
import 'package:gulf_catalog_app/core/configs/assets/app_vectors.dart';
import 'package:gulf_catalog_app/core/configs/theme/app_theme.dart';
import 'package:gulf_catalog_app/features/catalog/catalog.dart';

class MySearchBar extends StatefulWidget {
  const MySearchBar({
    super.key,
  });

  @override
  State<MySearchBar> createState() => _MySearchBarState();
}

class _MySearchBarState extends State<MySearchBar> {
  String? query;
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = context.theme;
    return Row(
      children: [
        Expanded(
          child: TextField(
            cursorColor: theme.appColors.accent,
            decoration: InputDecoration(
              hintText: "Search product...",
              // prefixIcon: const Icon(Icons.search),
              prefixIconColor: theme.appColors.onSurfacePrimary,
              filled: true,
              fillColor: theme.appColors.onAccent,
              hintStyle: theme.appTextStyles.bodyAlt1.copyWith(fontSize: 14),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: theme.appColors.border),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(14),
                    bottomLeft: Radius.circular(14)),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: theme.appColors.border),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(14),
                  bottomLeft: Radius.circular(14),
                ),
              ),
            ),
            onChanged: (value) {
              setState(() {
                query = value;
              });
            },
          ),
        ),
        Container(
          width: 60,
          height: double.infinity,
          decoration: BoxDecoration(
            color: theme.appColors.border,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(14),
              bottomRight: Radius.circular(14),
            ),
          ),
          child: Center(
            child: ActionButton(
              onPressed: () {
                context
                    .read<CatalogBloc>()
                    .add(CatalogFetchEvent(reference: query));
              },
              radius: const BorderRadius.only(
                topRight: Radius.circular(14),
                bottomRight: Radius.circular(14),
              ),
              fillColor: theme.appColors.border,
              icon: AppVectors.home,
              iconColor: theme.appColors.onSurfaceSecondary2,
            ),
          ),
        )
      ],
    );
  }
}
