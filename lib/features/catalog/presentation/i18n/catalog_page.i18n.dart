import 'package:i18n_extension/i18n_extension.dart';

extension Localization on Object {
  static final _t = Translations.byId<Object>('en_us', {});

  String get i18n => localize(this, _t);
}
