import 'package:equatable/equatable.dart';

class Image extends Equatable {
  final String url;
  final bool? isDown;
  final DateTime? updatedAt;

  const Image({
    required this.url,
    required this.isDown,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [
        url,
        isDown,
        updatedAt,
      ];
}
