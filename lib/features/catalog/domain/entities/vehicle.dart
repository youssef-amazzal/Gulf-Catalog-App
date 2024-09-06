import 'package:equatable/equatable.dart';

class Vehicle extends Equatable {
  final String name;
  final num? kw;
  final num? hp;
  final num? capacityCc;
  final String? engine;
  final String? bodyStyle;
  final DateTime? beginYearMonth;
  final DateTime? endYearMonth;
  final DateTime? updatedAt;

  const Vehicle({
    required this.name,
    required this.kw,
    required this.hp,
    required this.capacityCc,
    required this.engine,
    required this.bodyStyle,
    required this.beginYearMonth,
    required this.endYearMonth,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [
        name,
        kw,
        hp,
        capacityCc,
        engine,
        bodyStyle,
        beginYearMonth,
        endYearMonth,
        updatedAt
      ];
}
