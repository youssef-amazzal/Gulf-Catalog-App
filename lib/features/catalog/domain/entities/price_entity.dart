import 'package:equatable/equatable.dart';

class Price extends Equatable {
  final num price;
  final num quantity;
  final num? discount;
  final DateTime? expirationDate;
  final DateTime? updatedAt;

  const Price({
    required this.price,
    required this.quantity,
    required this.discount,
    required this.expirationDate,
    required this.updatedAt,
  });

  @override
  List<Object?> get props =>
      [price, quantity, discount, expirationDate, updatedAt];
}
