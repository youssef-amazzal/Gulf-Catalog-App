import 'package:equatable/equatable.dart';

class Manufacturer extends Equatable {
  final num id;
  final String name;
  final String? logo;
  final DateTime? updatedAt;

  const Manufacturer({
    required this.id,
    required this.name,
    required this.logo,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        logo,
        updatedAt,
      ];
}
