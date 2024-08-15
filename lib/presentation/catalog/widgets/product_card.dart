import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:gulf_catalog_app/common/widgets/svg_icon.dart';
import 'package:gulf_catalog_app/core/configs/assets/app_vectors.dart';
import 'package:gulf_catalog_app/core/configs/theme/app_theme.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = context.theme;

    return GestureDetector(
      onTap: () => {context.push('/catalog/id')},
      child: Container(
        decoration: BoxDecoration(
          color: theme.appColors.surface1,
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.all(15),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Expanded(
            child: Stack(
              fit: StackFit.expand,
              children: [
                Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Image.asset(
                      'assets/images/products/CF-112/CF-112_0.webp',
                      fit: BoxFit.cover,
                    ))
              ],
            ),
          ),
          const Gap(10),
          Text(
            'CF-112',
            style: theme.appTextStyles.h1.copyWith(fontSize: 15),
          ),
          Text(
            'Maître-cylindre de frein',
            overflow: TextOverflow.ellipsis,
            style: theme.appTextStyles.bodyAlt1
                .copyWith(fontSize: 12.5, fontWeight: FontWeight.w600),
          ),
          const Gap(10),
          Row(children: [
            SvgIcon(
              icon: AppVectors.package,
              height: 15,
              color: theme.appColors.onSurfaceSecondary1,
            ),
            const Gap(5),
            Text(
              'Stocked Product: ',
              style: theme.appTextStyles.bodyAlt1
                  .copyWith(fontSize: 13.5, fontWeight: FontWeight.w600),
            ),
            Text(
              '21 in stock',
              style: theme.appTextStyles.bodyAlt1.copyWith(
                  fontSize: 13.5,
                  color: theme.appColors.onSurfacePrimary,
                  fontWeight: FontWeight.w600),
            ),
          ]),
          Divider(
            color: theme.appColors.border,
            thickness: 2,
            height: 30,
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Unit Price',
                      overflow: TextOverflow.ellipsis,
                      style: theme.appTextStyles.bodyAlt1
                          .copyWith(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    const Gap(10),
                    Text(
                      '236 Dh',
                      overflow: TextOverflow.ellipsis,
                      style: theme.appTextStyles.body1
                          .copyWith(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Mass Price',
                      overflow: TextOverflow.ellipsis,
                      style: theme.appTextStyles.bodyAlt1
                          .copyWith(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    const Gap(10),
                    Text(
                      '-',
                      overflow: TextOverflow.ellipsis,
                      style: theme.appTextStyles.body1
                          .copyWith(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              )
            ],
          )
        ]),
      ),
    );
  }
}
