import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'filter_section.dart';
import 'results_section.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [FilterSection(), Gap(20), Expanded(child: ResultsSection())],
    );
  }
}
