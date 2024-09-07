import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:gulf_catalog_app/common/widgets/svg_icon.dart';
import 'package:gulf_catalog_app/core/configs/assets/app_vectors.dart';
import 'package:gulf_catalog_app/core/configs/theme/app_theme.dart';
import 'package:gulf_catalog_app/features/catalog/domain/entities/product.dart';
import 'package:gulf_catalog_app/features/catalog/presentation/bloc/details/details_bloc.dart';
import 'package:gulf_catalog_app/features/catalog/presentation/i18n/categories.i18n.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = context.theme;

    return GestureDetector(
      onTap: () {
        context
            .read<DetailsBloc>()
            .add(DetailsFetchEvent(productId: product.id.toInt()));
        context.push('/catalog/${product.id}');
      },
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
              children: [_CardImage(product: product)],
            ),
          ),
          const Gap(10),
          _CardTitle(product: product),
          _CardSubtitle(
            product: product,
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
              '${product.quantity} in stock',
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
                      '${product.unitPrice?.price ?? -1} Dh',
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
                      'Pack Price',
                      overflow: TextOverflow.ellipsis,
                      style: theme.appTextStyles.bodyAlt1
                          .copyWith(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    const Gap(10),
                    Text(
                      '${product.packPrices.isNotEmpty ? product.packPrices.first.price : '-'} Dh',
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

class _CardSubtitle extends StatelessWidget {
  final Product product;
  const _CardSubtitle({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Text(
      product.category?.name.i18n ?? '',
      overflow: TextOverflow.ellipsis,
      style: theme.appTextStyles.bodyAlt1
          .copyWith(fontSize: 12.5, fontWeight: FontWeight.w600),
    );
  }
}

class _CardTitle extends StatelessWidget {
  final Product product;

  const _CardTitle({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Text(
      product.reference ?? "",
      style: theme.appTextStyles.h1.copyWith(fontSize: 15),
    );
  }
}

class _CardImage extends StatelessWidget {
  const _CardImage({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: Colors.white),
        child: CachedNetworkImage(
          imageUrl: product.thumbnail?.url ?? '',
          memCacheHeight: 300,
          fadeInDuration: const Duration(milliseconds: 0),
          fadeOutDuration: const Duration(milliseconds: 0),
          placeholderFadeInDuration: const Duration(milliseconds: 0),
          httpHeaders: const {"Connection": "Keep-Alive"},
          placeholder: (context, url) =>
              Image.asset('assets/images/placeholder.png'),
          errorWidget: (context, url, error) =>
              Image.asset('assets/images/placeholder.png'),
          fit: BoxFit.contain,
        ));
  }
}
