import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'i18n.keys.dart';

class AppLocalizations {
  Locale locale;
  final Locale fallbackLocale = const Locale.fromSubtags(languageCode: "en");

  static late AppLocalizations instance;

  AppLocalizations._init(this.locale) {
    instance = this;
  }

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  Map<String, String>? _localizedStrings;
  Map<String, String>? _fallbackLocalizedStrings;

  Future<void> load() async {
    _localizedStrings = await _loadLocalizedStrings(locale);
    if (locale.languageCode != fallbackLocale.languageCode) {
      _fallbackLocalizedStrings = await _loadLocalizedStrings(fallbackLocale);
    }
  }

  Future<Map<String, String>> _loadLocalizedStrings(
    Locale localeToBeLoaded,
  ) async {
    String jsonString;

    Map<String, String> localizedStrings = {};

    try {
      jsonString = await rootBundle.loadString(
        'assets/i18n/languages/${localeToBeLoaded.languageCode}.json',
      );
    } catch (_) {
      return localizedStrings;
    }

    Map<String, dynamic> jsonMap = json.decode(jsonString);

    localizedStrings = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });

    return localizedStrings;
  }

  String translate(I18nKeys key, [Map<I18nArgs, String?>? arguments]) {
    String? translation = _localizedStrings?[key.name];
    translation ??= _fallbackLocalizedStrings?[key.name];
    translation ??= "";

    if (arguments == null || arguments.isEmpty) {
      return translation;
    }

    arguments.forEach((argumentKey, value) {
      value ??= '';
      translation = translation!.replaceAll("\$${argumentKey.name}", value);
    });

    return translation!;
  }

  SharedPreferences? _pref;

  Future<void> changeLanguage(String languageCode) async {
    _pref ??= await SharedPreferences.getInstance();
    await _pref?.setString('language_code', languageCode);
    String? scriptCode;
    if (languageCode.contains("_")) {
      scriptCode = languageCode.split("_").last;
      await _pref?.setString('script_code', scriptCode);
    } else {
      await _pref?.remove('script_code');
    }

    await _changeLanguage(languageCode, scriptCode);
  }

  Future<void> _changeLanguage(String? langCode, [String? scriptCode]) async {
    if (langCode != null) {
      locale = Locale.fromSubtags(
        languageCode: langCode,
        scriptCode: scriptCode,
      );
      await load();
    }
  }
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return true;
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    final prefs = await SharedPreferences.getInstance();
    final langCode = prefs.getString('language_code');
    final scriptCode = prefs.getString('script_code');
    AppLocalizations localizations = AppLocalizations._init(
      Locale.fromSubtags(
        languageCode: langCode ?? locale.languageCode,
        scriptCode: scriptCode ?? locale.scriptCode,
      ),
    );
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
