import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:gulf_catalog_app/common/widgets/svg_icon.dart';
import 'package:gulf_catalog_app/core/configs/assets/app_vectors.dart';
import 'package:gulf_catalog_app/core/configs/theme/app_theme.dart';
import 'package:gulf_catalog_app/core/configs/theme/new/app_theme.dart';
import 'package:gulf_catalog_app/core/extensions/responsive/responsive.dart';
import 'package:gulf_catalog_app/features/catalog/domain/entities/product.dart';
import 'package:gulf_catalog_app/features/catalog/presentation/bloc/details/details_bloc.dart';
import 'package:gulf_catalog_app/features/catalog/presentation/i18n/catalog.i18n.dart';
import 'package:gulf_catalog_app/features/catalog/presentation/product_details/widgets/carousel.dart';
import 'package:gulf_catalog_app/features/catalog/presentation/product_details/widgets/compatible_vehicles/compatible_vehicles_panel.dart';
import 'package:gulf_catalog_app/features/catalog/presentation/product_details/widgets/cross_references/cross_refs_panel.dart';
import 'package:gulf_catalog_app/features/catalog/presentation/product_details/widgets/general_information/general_information_panel.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
          child: Column(
            children: [
              const DetailsToolBar(),
              const Gap(24),
              BlocConsumer<DetailsBloc, DetailsState>(
                listener: (context, state) {
                  if (state is DetailsFailedFetching) {
                    print('Failed to fetch product: ${state.message}');
                  }
                },
                builder: (context, state) {
                  if (state is! DetailsSuccessfulFetching) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: colorScheme.primary,
                      ),
                    );
                  }

                  final product = state.product;

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _TitleBar(product: product),
                      const Gap(24),
                      LayoutBuilder(builder: (context, constraints) {
                        return Column(
                          children: [
                            SizedBox(
                              height: constraints.maxWidth / 2.7 - (24 / 2),
                              width: constraints.maxWidth,
                              child: Row(
                                children: [
                                  Carousel(images: product.images),
                                  const Gap(24),
                                  Expanded(
                                    child: GeneralInformationPanel(
                                      product: product,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Gap(24),
                            Builder(builder: (context) {
                              final crossRefs = product.crossRefs;
                              final oeRefs = product.oeRefs;
                              final vehicles = product.vehicles;

                              final hasNotAddInfo = crossRefs.isEmpty &&
                                  oeRefs.isEmpty &&
                                  vehicles.isEmpty;

                              if (hasNotAddInfo) {
                                return const SizedBox();
                              }

                              return Padding(
                                padding: const EdgeInsets.only(bottom: 30),
                                child: SizedBox(
                                  height: context.responsive(500, xl: 700),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: constraints.maxWidth / 2.7 -
                                            (24 / 2),
                                        child: CrossRefsPanel(
                                          crossRefs: crossRefs,
                                          oeRefs: oeRefs,
                                        ),
                                      ),
                                      const Gap(24),
                                      Expanded(
                                        child: CompatibleVehiclesPanel(
                                          vehicles: vehicles,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            })
                          ],
                        );
                      }),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TitleBar extends StatelessWidget {
  const _TitleBar({
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    String title = product.reference ?? '';

    if (product.category?.name == 'additive') {
      if (product.details?[0].details?['typeAbrv'] != null) {
        final typeAbrv = product.details?[0].details?['typeAbrv'];
        final type = product.details?[0].details?['type'];
        title = '$typeAbrv - $type';
      }
    }

    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: context.responsive(
                textTheme.headlineMedium,
                xl: textTheme.headlineLarge,
              ),
            ),
            Text(
              product.category!.name.i18n,
              style: context.responsive(
                textTheme.titleMedium!.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
                xl: textTheme.titleLarge!.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}

class DetailsToolBar extends StatelessWidget {
  const DetailsToolBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    return SizedBox(
      height: context.responsive(45, xl: 55),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
              color: colorScheme.inverseSurface,
              borderRadius: MAppTheme.kRadius,
              // border: Border.all(
              //   color: colorScheme.outline,
              //   width: 0.5,
              // ),
            ),
            child: IconButton(
              onPressed: () => context.pop(),
              icon: SvgIcon(
                icon: AppVectors.backArrow,
                height: context.responsive(25, xl: 35),
                color: colorScheme.onInverseSurface,
              ),
            ),
          ),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: colorScheme.error,
                  borderRadius: MAppTheme.kRadius,
                ),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    overlayColor: colorScheme.onError,
                    minimumSize: const Size.fromWidth(100),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.warning_rounded,
                        color: colorScheme.onError,
                      ),
                      const Gap(10),
                      Text(
                        'report'.i18n,
                        style: textTheme.labelLarge!.copyWith(
                          color: colorScheme.onError,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const Gap(20),
              Container(
                decoration: BoxDecoration(
                  color: colorScheme.secondary.withOpacity(0.1),
                  borderRadius: MAppTheme.kRadius,
                ),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    overlayColor: colorScheme.secondary,
                    minimumSize: const Size.fromWidth(100),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.add_shopping_cart_rounded,
                        color: colorScheme.secondary,
                      ),
                      const Gap(10),
                      Text(
                        'add_order'.i18n,
                        style: textTheme.labelLarge!.copyWith(
                          color: colorScheme.secondary,
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
