import 'package:flutter/material.dart';
import 'package:gulf_catalog_app/features/catalog/presentation/product_details/widgets/panel.dart';
import 'package:gulf_catalog_app/models/cross_ref_brand.dart';
import 'package:gulf_catalog_app/features/catalog/presentation/product_details/widgets/panel_search_bar.dart';
import 'brand_tile.dart';

class CrossRefsPanel extends StatefulWidget {
  const CrossRefsPanel({
    super.key,
  });

  @override
  State<CrossRefsPanel> createState() => _CrossRefsPanelState();
}

class _CrossRefsPanelState extends State<CrossRefsPanel> {
  List<CrossRefBrand> filterdData = [];
  List<CrossRefBrand> data = [
    CrossRefBrand(
        key: 0,
        brand: 'ASHIKA',
        imageUrl: 'https://cdn.autodoc.de/brands/thumbs/10029.png',
        references: ['90-01-112']),
    CrossRefBrand(
        key: 1,
        brand: 'LuK',
        imageUrl: 'https://cdn.autodoc.de/brands/thumbs/6.png',
        references: ['510 0111 10', '510 0164 10']),
    CrossRefBrand(
        key: 2,
        brand: 'LPR',
        imageUrl: 'https://cdn.autodoc.de/brands/thumbs/480.png',
        references: [
          '30620-00Q0H',
          '3062000Q1G',
          '306A0-JA60A',
          '306A0-JA60B',
          '306A0-JA60C',
          '32150-00QAA',
          '32150-00QAB',
          '32150-00QAC',
          '32150-00QAD'
        ]),
  ];

  @override
  void initState() {
    super.initState();
    filterdData = List.from(data);
  }

  @override
  Widget build(BuildContext context) {
    return Panel(
        title: 'Cross References',
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                    child: PanelSearchBar(
                        hintText: "Search reference, oem...",
                        onChanged: _search))
              ],
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: filterdData.length,
                itemBuilder: (context, index) {
                  return BrandTile(
                    key: Key(filterdData[index].key.toString()),
                    index: index,
                    brand: filterdData[index].brand,
                    references: filterdData[index].references,
                    imageUrl: filterdData[index].imageUrl,
                  );
                },
              ),
            ),
          ],
        ));
  }

  void _search(String? value) {
    setState(() {
      // Create a deep copy of the data list
      filterdData = List.from(data.map((e) {
        var copiedElement = e.copyWith(
          references: List.from(e.references),
        );

        copiedElement.references = copiedElement.references
            .where((element) => element
                .toLowerCase()
                .replaceAll(RegExp(r'[\s-]'), '')
                .contains(value!.toLowerCase()))
            .toList();
        return copiedElement;
      }).toList());

      filterdData = filterdData
          .where((element) => element.references.isNotEmpty)
          .toList();
    });
  }
}
