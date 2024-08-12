import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gulf_catalog_app/presentation/catalog/widgets/tool_bar.dart';
import 'package:gulf_catalog_app/presentation/catalog/widgets/product_card.dart';

class ResultsSection extends StatelessWidget {
  const ResultsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const ToolBar(),
      const Gap(20),
      Expanded(
          child: GridView.count(
              childAspectRatio: 0.8,
              padding: const EdgeInsets.all(0),
              crossAxisCount:
                  (MediaQuery.of(context).size.width ~/ 350).toInt(),
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              children: generateCards(9)))
    ]);
  }
}

generateCards(int nbrCards) {
  List<Widget> cards = [];
  for (int i = 0; i < nbrCards; i++) {
    cards.add(const ProductCard());
  }
  return cards;
}
