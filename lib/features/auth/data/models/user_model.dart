import 'package:gulf_catalog_app/common/entities/user_entity.dart';

class UserModel extends User {
  const UserModel({required super.id, required super.name});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? '',
      name: json['name'] ?? 'Anonymous',
    );
  }
}
