import 'package:gulf_catalog_app/features/catalog/domain/entities/section.dart';

class SectionModel extends Section {
  SectionModel({required super.title, required super.details});

  factory SectionModel.fromJson(Map<String, dynamic> json) {
    return SectionModel(
      title: json['title'],
      details: json['details'],
    );
  }
}
