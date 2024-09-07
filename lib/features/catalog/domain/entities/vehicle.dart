import 'package:equatable/equatable.dart';

class Vehicle extends Equatable {
  final num id;
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
    required this.id,
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
        id,
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

  copyWith({
    num? id,
    String? name,
    num? kw,
    num? hp,
    num? capacityCc,
    String? engine,
    String? bodyStyle,
    DateTime? beginYearMonth,
    DateTime? endYearMonth,
    DateTime? updatedAt,
  }) {
    return Vehicle(
      id: id ?? this.id,
      name: name ?? this.name,
      kw: kw ?? this.kw,
      hp: hp ?? this.hp,
      capacityCc: capacityCc ?? this.capacityCc,
      engine: engine ?? this.engine,
      bodyStyle: bodyStyle ?? this.bodyStyle,
      beginYearMonth: beginYearMonth ?? this.beginYearMonth,
      endYearMonth: endYearMonth ?? this.endYearMonth,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
