import 'package:gulf_catalog_app/common/i18n/common.i18n.dart';
import 'package:gulf_catalog_app/features/catalog/presentation/i18n/catalog_page.i18n.dart';
import 'package:gulf_catalog_app/features/catalog/presentation/i18n/categories.i18n.dart';
import 'package:gulf_catalog_app/features/catalog/presentation/i18n/details_page.i18n.dart';
import 'package:i18n_extension/i18n_extension.dart';

extension Localization on Object {
  static final translations = commonTranslations *
      catalogPageTranslation *
      detailsPageTranslation *
      categoriesTranslation;
  String get i18n => localize(this, translations);
}
