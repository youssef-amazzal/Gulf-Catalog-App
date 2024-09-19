import 'package:i18n_extension/i18n_extension.dart';

final commonTranslations = Translations.byId<String>(
  'en_us',
  {
    'search_hint': {'en': 'Search...', 'fr': 'Rechercher...'},
  },
);

extension Localization on Object {
  static final translations = commonTranslations;
  String get i18n => localize(this, translations);
}
