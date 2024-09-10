import 'package:gulf_catalog_app/features/catalog/presentation/bloc/filter/filter_cubit.dart';

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
