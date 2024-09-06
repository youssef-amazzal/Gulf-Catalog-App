import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final num id;
  final String name;
  final DateTime? updatedAt;

  const Category({
    required this.id,
    required this.name,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        updatedAt,
      ];
}
