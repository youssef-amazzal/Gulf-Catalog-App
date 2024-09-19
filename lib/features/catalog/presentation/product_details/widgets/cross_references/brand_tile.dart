import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gulf_catalog_app/core/configs/theme/app_theme.dart';
import 'package:gulf_catalog_app/core/extensions/responsive/responsive.dart';
import 'package:gulf_catalog_app/features/catalog/presentation/product_details/widgets/cross_references/reference_text.dart';

class BrandTile extends StatelessWidget {
  final int index;
  final String brand;
  final String? imageUrl;
  final List<String> references;

  const BrandTile({
    super.key,
    required this.index,
    required this.brand,
    this.imageUrl,
    required this.references,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Container(
      decoration: BoxDecoration(
        border: Border.symmetric(
          horizontal: BorderSide(
            color: colorScheme.outline.withOpacity(0.3),
            width: 0.5,
          ),
        ),
      ),
      child: ExpansionTile(
          tilePadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
          collapsedBackgroundColor: index % 2 == 0
              ? colorScheme.surfaceDim.withOpacity(0.3)
              : colorScheme.surface,
          backgroundColor: index % 2 == 0
              ? colorScheme.surfaceDim.withOpacity(0.3)
              : colorScheme.surface,
          iconColor: colorScheme.primary,
          collapsedIconColor: colorScheme.primary,
          shape: Border.all(color: Colors.transparent, width: 0),
          title: Row(
            children: [
              Container(
                height: context.responsive(40, xl: 50),
                width: context.responsive(60, xl: 70),
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: context.theme.brightness == Brightness.dark
                      ? Colors.white
                      : Colors.transparent,
                  // border:
                  //     Border.all(color: Colors.blueGrey[800]!, width: 0.5),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: CachedNetworkImage(
                    imageUrl: imageUrl ?? "",
                    fit: BoxFit.contain,
                    memCacheWidth: 80,
                    httpHeaders: const {
                      "referer": "https://web.tecalliance.net/"
                    },
                    placeholder: (context, url) =>
                        Image.asset('assets/images/placeholder.png'),
                    errorWidget: (context, url, error) =>
                        Image.asset('assets/images/placeholder.png')),
              ),
              const Gap(20),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        brand,
                        style: context.responsive(
                          textTheme.bodySmall,
                          xl: textTheme.bodyLarge,
                        ),
                      ),
                    ),
                    const Gap(10),
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: colorScheme.surfaceDim,
                        // border: Border.all(color: theme.appColors.accent, width: 1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          '${references.length}',
                          style: textTheme.labelMedium!.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          children: [
            ListTile(
              title: GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: context.responsive(2, xl: 3),
                  childAspectRatio: context.responsive(4, xl: 3),
                  crossAxisSpacing: 3,
                  mainAxisSpacing: 1,
                  children: _buildReferenceTexts()),
              tileColor: colorScheme.surface,
            ),
          ]),
    );
  }

  List<Widget> _buildReferenceTexts() {
    return references
        .map((reference) => ReferenceText(reference: reference))
        .toList();
  }
}
