

import 'package:starter/i18n/applocalizations.dart';
import 'package:starter/i18n/i18n.keys.dart';

extension Translator on I18nKeys {
  String get translate {
    return AppLocalizations.instance.translate(this);
  }

  String dynamicTranslate([Map<I18nArgs, String?>? arguments]) {
    return AppLocalizations.instance.translate(this, arguments);
  }
}
