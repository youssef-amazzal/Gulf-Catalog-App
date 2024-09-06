import 'package:equatable/equatable.dart';
import 'package:gulf_catalog_app/features/catalog/domain/entities/brand.dart';

class CrossRef extends Equatable {
  final String ref;
  final Brand brand;
  final DateTime? updatedAt;

  const CrossRef({
    required this.ref,
    required this.brand,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [
        ref,
        brand,
        updatedAt,
      ];
}
