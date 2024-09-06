import 'package:gulf_catalog_app/features/catalog/domain/entities/image.dart';

class ImageModel extends Image {
  const ImageModel(
      {required super.url, required super.isDown, required super.updatedAt});

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
        url: json['url'],
        isDown: json['isDown'] ?? true,
        updatedAt: json['updated_at'] != null
            ? DateTime.parse(json['updated_at'])
            : null);
  }
}
