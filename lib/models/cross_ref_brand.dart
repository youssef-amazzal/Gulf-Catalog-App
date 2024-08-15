class CrossRefBrand {
  final int key;
  final String brand;
  final String imageUrl;
  List<String> references;

  CrossRefBrand({
    required this.key,
    required this.brand,
    required this.imageUrl,
    required this.references,
  });

  CrossRefBrand copyWith(
      {int? key, String? imageUrl, String? brand, List<String>? references}) {
    return CrossRefBrand(
      key: key ?? this.key,
      brand: brand ?? this.brand,
      imageUrl: imageUrl ?? this.imageUrl,
      references: references ?? List.from(this.references),
    );
  }
}
