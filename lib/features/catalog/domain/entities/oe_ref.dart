import 'package:equatable/equatable.dart';
import 'package:gulf_catalog_app/features/catalog/domain/entities/manufacturer.dart';

class OeRef extends Equatable {
  final String ref;
  final Manufacturer mfr;
  final DateTime? updatedAt;

  const OeRef({
    required this.ref,
    required this.mfr,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [
        ref,
        mfr,
        updatedAt,
      ];
}
