import 'package:gulf_catalog_app/features/catalog/catalog.dart';

class MyGroupButtonOptions {
  final String label;
  final double? width;
  final Availability status;

  const MyGroupButtonOptions({
    required this.label,
    this.width,
    required this.status,
  });
}
