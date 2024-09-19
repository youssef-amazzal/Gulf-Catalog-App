import 'package:i18n_extension/i18n_extension.dart';

extension Localization on Object {
  static final routesTranslation = Translations.byId<String>(
    'en_us',
    {
      'catalog': {'en': 'Catalog', 'fr': 'Catalogue'},
      'categories': {'en': 'Categories', 'fr': 'Catégories'},
      'orders': {'en': 'Orders', 'fr': 'Commandes'},
      'clients': {'en': 'Clients', 'fr': 'Clients'},
      'dashboard': {'en': 'Dashboard', 'fr': 'Tableau de bord'},
      'settings': {'en': 'Settings', 'fr': 'Paramètres'},
      'notifications': {'en': 'Notifications', 'fr': 'Notifications'},
    },
  );

  static final translations = routesTranslation;
  String get i18n => localize(this, translations);
}
