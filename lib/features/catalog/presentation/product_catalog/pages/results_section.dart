import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:gulf_catalog_app/features/catalog/domain/entities/product_entity.dart';
import 'package:gulf_catalog_app/features/catalog/presentation/bloc/product/product_bloc.dart';
import 'package:gulf_catalog_app/features/catalog/presentation/product_catalog/widgets/tool_bar.dart';
import 'package:gulf_catalog_app/features/catalog/presentation/product_catalog/widgets/product_card.dart';

class ResultsSection extends StatefulWidget {
  const ResultsSection({super.key});

  @override
  State<ResultsSection> createState() => _ResultsSectionState();
}

class _ResultsSectionState extends State<ResultsSection> {
  late List<Product> products;

  @override
  void initState() {
    super.initState();
    context.read<ProductBloc>().add(FetchProductsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const ToolBar(),
      const Gap(20),
      Expanded(
          child: BlocConsumer<ProductBloc, ProductState>(
        listener: (context, state) {
          if (state is ProductSuccessfulFetching) {
            products = state.products;
          }

          if (state is ProductFailedFetching) {
            print('Failed to fetch products: ${state.message}');
          }
        },
        builder: (context, state) {
          if (state is ProductSuccessfulFetching) {
            return GridView.count(
                childAspectRatio: 0.8,
                padding: const EdgeInsets.all(0),
                crossAxisCount:
                    (MediaQuery.of(context).size.width ~/ 350).toInt(),
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                children: generateCards(state.products));
          } else {
            return const Center(child: Text("Still Fetchin..."));
          }
        },
      ))
    ]);
  }
}

generateCards(List<Product> products) {
  return products.map((p) => ProductCard(product: p)).toList();
}
