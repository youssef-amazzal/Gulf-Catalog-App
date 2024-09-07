import 'package:flutter/material.dart';
import "package:collection/collection.dart";
import 'package:gulf_catalog_app/features/catalog/domain/entities/cross_ref.dart';
import 'package:gulf_catalog_app/features/catalog/domain/entities/oe_ref.dart';
import 'package:gulf_catalog_app/features/catalog/presentation/product_details/widgets/panel.dart';
import 'package:gulf_catalog_app/features/catalog/presentation/product_details/widgets/panel_search_bar.dart';
import 'brand_tile.dart';

class CrossRefsPanel extends StatefulWidget {
  final List<CrossRef> crossRefs;
  final List<OeRef> oeRefs;
  const CrossRefsPanel({
    super.key,
    required this.crossRefs,
    required this.oeRefs,
  });

  @override
  State<CrossRefsPanel> createState() => _CrossRefsPanelState();
}

class _CrossRefsPanelState extends State<CrossRefsPanel> {
  List<GroupedRefs> filterdData = [];
  late final List<GroupedRefs> data;

  @override
  void initState() {
    super.initState();

    final oeGroupes =
        widget.oeRefs.groupListsBy((e) => e.mfr).entries.map((entry) {
      return GroupedRefs(
        key: entry.key.id.toInt(),
        brand: entry.key.name,
        imageUrl: entry.key.logo,
        references: entry.value.map((e) => e.ref).toList(),
      );
    }).sortedBy((key) => key.brand);

    final crossGroupes =
        widget.crossRefs.groupListsBy((e) => e.brand).entries.map((entry) {
      return GroupedRefs(
        key: entry.key.id.toInt(),
        brand: entry.key.name,
        imageUrl: entry.key.logo,
        references: entry.value.map((e) => e.ref).toList(),
      );
    }).sortedBy((key) => key.brand);

    data = [...oeGroupes, ...crossGroupes].toList();
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

class GroupedRefs {
  final int key;
  final String brand;
  final String? imageUrl;
  List<String> references;

  GroupedRefs({
    required this.key,
    required this.brand,
    required this.imageUrl,
    required this.references,
  });

  GroupedRefs copyWith(
      {int? key, String? imageUrl, String? brand, List<String>? references}) {
    return GroupedRefs(
      key: key ?? this.key,
      brand: brand ?? this.brand,
      imageUrl: imageUrl ?? this.imageUrl,
      references: references ?? List.from(this.references),
    );
  }
}
