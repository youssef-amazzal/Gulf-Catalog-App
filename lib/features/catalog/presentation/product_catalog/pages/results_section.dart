import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:gulf_catalog_app/core/configs/theme/app_theme.dart';
import 'package:gulf_catalog_app/features/catalog/domain/entities/product.dart';
import 'package:gulf_catalog_app/features/catalog/presentation/bloc/filter/filter_cubit.dart';
import 'package:gulf_catalog_app/features/catalog/presentation/bloc/catalog/catalog_bloc.dart';
import 'package:gulf_catalog_app/features/catalog/presentation/product_catalog/widgets/tool_bar.dart';
import 'package:gulf_catalog_app/features/catalog/presentation/product_catalog/widgets/product_card.dart';

class ResultsSection extends StatefulWidget {
  const ResultsSection({super.key});

  @override
  State<ResultsSection> createState() => _ResultsSectionState();
}

class _ResultsSectionState extends State<ResultsSection> {
  @override
  void initState() {
    super.initState();
    context.read<CatalogBloc>().add(CatalogFetchEvent());
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Column(children: [
      const ToolBar(),
      const Gap(20),
      Expanded(
          child: BlocConsumer<CatalogBloc, CatalogState>(
        listener: (context, state) {
          if (state is CatalogFailedFetching) {
            print('Failed to fetch products: ${state.message}');
          }
        },
        builder: (context, catalogState) {
          if (catalogState is CatalogSuccessfulFetching) {
            return BlocBuilder<FilterCubit, FilterState>(
              builder: (context, stockState) {
                List<Product> products =
                    List<Product>.from(catalogState.products);

                if (stockState is FilteredState) {
                  switch (stockState.availability) {
                    case Availability.inStock:
                      products =
                          products.where((p) => (p.quantity ?? 0) > 0).toList();
                      break;
                    case Availability.outOfStock:
                      products = products
                          .where((p) => (p.quantity ?? 0) == 0)
                          .toList();
                      break;
                    default:
                      break;
                  }

                  if (stockState.category != null) {
                    products = products
                        .where((p) => p.category!.name == stockState.category)
                        .toList();
                  }

                  if (stockState.sortBy != null) {
                    switch (stockState.sortBy) {
                      case SortBy.alphaAsc:
                        products.sort(
                            (a, b) => a.reference!.compareTo(b.reference!));
                        break;
                      case SortBy.alphaDesc:
                        products.sort(
                            (a, b) => b.reference!.compareTo(a.reference!));
                        break;
                      case SortBy.stockAsc:
                        products.sort((a, b) =>
                            (a.quantity ?? 0).compareTo(b.quantity ?? 0));
                        break;
                      case SortBy.stockDesc:
                        products.sort((a, b) =>
                            (b.quantity ?? 0).compareTo(a.quantity ?? 0));
                        break;
                      case SortBy.priceAsc:
                        products.sort((a, b) =>
                            a.unitPrice!.price.compareTo(b.unitPrice!.price));
                        break;
                      case SortBy.priceDesc:
                        products.sort((a, b) =>
                            b.unitPrice!.price.compareTo(a.unitPrice!.price));
                        break;
                      case SortBy.updatedAsc:
                        products.sort(
                            (a, b) => a.updatedAt!.compareTo(b.updatedAt!));
                        break;
                      case SortBy.updatedDesc:
                        products.sort(
                            (a, b) => b.updatedAt!.compareTo(a.updatedAt!));
                        break;
                      default:
                        break;
                    }
                  }
                }

                return GridView.count(
                    childAspectRatio: 0.8,
                    padding: const EdgeInsets.all(0),
                    crossAxisCount:
                        (MediaQuery.of(context).size.width ~/ 350).toInt(),
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    children: _generateCards(products));
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(
                color: theme.appColors.accent,
              ),
            );
          }
        },
      ))
    ]);
  }
}

_generateCards(List<Product> products) {
  return products.map((p) => ProductCard(product: p)).toList();
}
