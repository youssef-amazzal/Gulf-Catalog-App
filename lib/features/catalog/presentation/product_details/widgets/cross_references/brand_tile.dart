import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gulf_catalog_app/core/configs/theme/app_theme.dart';
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
    return Container(
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(color: theme.appColors.border, width: 1.5))),
      child: ExpansionTile(
          tilePadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
          collapsedBackgroundColor: index % 2 == 0
              ? theme.appColors.surface2
              : theme.appColors.surface1,
          backgroundColor: index % 2 == 0
              ? theme.appColors.surface2
              : theme.appColors.surface1,
          iconColor: theme.appColors.accent,
          collapsedIconColor: theme.appColors.accent,
          shape: Border.all(color: Colors.transparent, width: 0),
          title: Row(
            children: [
              Container(
                height: 40,
                width: 80,
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  // border:
                  //     Border.all(color: Colors.blueGrey[800]!, width: 0.5),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Image.network(imageUrl!, fit: BoxFit.contain),
              ),
              const Gap(20),
              Text(
                brand,
                style: theme.appTextStyles.body1,
              ),
              const Spacer(),
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: theme.appColors.surface3,
                  // border: Border.all(color: theme.appColors.accent, width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text('${references.length}',
                      style: theme.appTextStyles.body1.copyWith(
                          fontWeight: FontWeight.w400,
                          color: theme.appColors.onSurfacePrimary,
                          fontSize: 13)),
                ),
              )
            ],
          ),
          children: [
            ListTile(
              title: GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 3,
                  childAspectRatio: 3,
                  children: _buildReferenceTexts()),
              tileColor: theme.appColors.onAccent,
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
