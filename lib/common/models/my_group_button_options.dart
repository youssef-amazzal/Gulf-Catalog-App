import 'package:gulf_catalog_app/features/catalog/presentation/bloc/filter/filter_cubit.dart';

class MyGroupButtonOptions {
  final String label;
  final double? width;

  const MyGroupButtonOptions({
    required this.label,
    this.width,
  });
}

class MyStatusButtonOptions extends MyGroupButtonOptions {
  final Availability status;

  const MyStatusButtonOptions({
    required super.label,
    super.width,
    required this.status,
  });
}

class MyPinButtonOptions extends MyGroupButtonOptions {
  final PinState pinState;

  const MyPinButtonOptions({
    required super.label,
    super.width,
    required this.pinState,
  });
}
