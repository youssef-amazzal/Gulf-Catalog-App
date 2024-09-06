import 'package:equatable/equatable.dart';

class CategoryEntity extends Equatable {
  final num id;
  final String name;

  const CategoryEntity({
    required this.id,
    required this.name,
  });

  @override
  List<Object?> get props {
    return [id, name];
  }
}
