import 'package:equatable/equatable.dart';

class Price extends Equatable {
  final num id;
  final num price;
  final num quantity;
  final num? discount;
  final DateTime? expirationDate;
  final DateTime? updatedAt;

  const Price({
    required this.id,
    required this.price,
    required this.discount,
    required this.quantity,
    required this.expirationDate,
    required this.updatedAt,
  });

  @override
  List<Object?> get props {
    return [price, discount, quantity, expirationDate, updatedAt];
  }
}
