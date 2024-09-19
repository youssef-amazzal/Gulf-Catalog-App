import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:gulf_catalog_app/common/widgets/svg_icon.dart';
import 'package:gulf_catalog_app/core/configs/assets/app_vectors.dart';
import 'package:gulf_catalog_app/core/configs/theme/app_theme.dart';
import 'package:gulf_catalog_app/core/extensions/responsive/responsive.dart';
import 'package:gulf_catalog_app/features/catalog/domain/entities/product.dart';
import 'package:gulf_catalog_app/features/catalog/presentation/bloc/details/details_bloc.dart';
import 'package:gulf_catalog_app/features/catalog/presentation/i18n/catalog.i18n.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return GestureDetector(
      onTap: () {
        context
            .read<DetailsBloc>()
            .add(DetailsFetchEvent(productId: product.id.toInt()));
        context.push('/catalog/${product.id}');
      },
      child: Container(
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(16),
        ),
        padding: EdgeInsets.all(context.responsive(10, xl: 15)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Expanded(
            child: Stack(
              fit: StackFit.expand,
              children: [_CardImage(product: product)],
            ),
          ),
          Gap(context.responsive(5, xl: 10)),
          _CardTitle(product: product),
          _CardSubtitle(
            product: product,
          ),
          Gap(context.responsive(5, xl: 10)),
          Row(
            children: [
              SvgIcon(
                icon: AppVectors.solidPackage,
                height: context.responsive(13, xl: 17),
                color: colorScheme.onSurfaceVariant,
              ),
              const Gap(5),
              Flexible(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '${'stocked_product'.i18n}: ',
                        style: context.responsive(
                          textTheme.labelSmall!
                              .copyWith(color: colorScheme.onSurfaceVariant),
                          xl: textTheme.labelLarge!
                              .copyWith(color: colorScheme.onSurfaceVariant),
                        ),
                      ),
                      TextSpan(
                        text: '${product.quantity} ${'product_in_stock'.i18n}',
                        style: context.responsive(
                          textTheme.labelSmall!,
                          xl: textTheme.labelLarge!,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Divider(
            color: colorScheme.outline.withOpacity(0.5),
            thickness: 1,
            height: context.responsive(20, xl: 30),
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'unit_price'.i18n,
                      overflow: TextOverflow.ellipsis,
                      style: context.responsive(
                        textTheme.labelSmall!
                            .copyWith(color: colorScheme.onSurfaceVariant),
                        xl: textTheme.labelLarge!
                            .copyWith(color: colorScheme.onSurfaceVariant),
                      ),
                    ),
                    Gap(context.responsive(5, xl: 10)),
                    Text(
                      '${product.unitPrice?.price ?? -1} Dh',
                      overflow: TextOverflow.ellipsis,
                      style: context.responsive(
                        textTheme.labelSmall,
                        xl: textTheme.labelLarge,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'pack_price'.i18n,
                      overflow: TextOverflow.ellipsis,
                      style: context.responsive(
                        textTheme.labelSmall!
                            .copyWith(color: colorScheme.onSurfaceVariant),
                        xl: textTheme.labelLarge!
                            .copyWith(color: colorScheme.onSurfaceVariant),
                      ),
                    ),
                    Gap(context.responsive(5, xl: 10)),
                    Text(
                      product.packPrices.isNotEmpty
                          ? '${product.packPrices.first.price} Dh'
                          : '-',
                      overflow: TextOverflow.ellipsis,
                      style: context.responsive(
                        textTheme.labelSmall,
                        xl: textTheme.labelLarge,
                      ),
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
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Text(
      product.category?.name.i18n ?? '',
      overflow: TextOverflow.ellipsis,
      style: context.responsive(
          textTheme.labelSmall!.copyWith(color: colorScheme.onSurfaceVariant),
          xl: textTheme.labelMedium!
              .copyWith(color: colorScheme.onSurfaceVariant)),
    );
  }
}

class _CardTitle extends StatelessWidget {
  final Product product;

  const _CardTitle({
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final textTheme = theme.textTheme;

    String title = product.reference ?? '';

    if (product.category?.name == 'additive') {
      title = product.details?[0].details?['typeAbrv'] ?? title;
    }
    return Text(
      title,
      style: context.responsive(textTheme.labelLarge, xl: textTheme.titleLarge),
    );
  }
}

class _CardImage extends StatelessWidget {
  const _CardImage({
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
