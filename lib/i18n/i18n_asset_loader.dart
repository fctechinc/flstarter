import 'dart:convert';

import 'package:flutter/services.dart';

class I18nAssetLoader {
  Future<Map<String, String>> get countryCodes async {
    final codes = await rootBundle.loadString(
      "assets/i18n/country_codes.json",
    );
    Map<String, dynamic> jsonCodes = json.decode(codes);
    final converted = Map<String, String>.from(
      jsonCodes.map(
        (key, value) => MapEntry(
          key,
          value.toString(),
        ),
      ),
    );
    return converted;
  }

  static Future<Map<String, String>> get languageCodes async {
    final codes = await rootBundle.loadString(
      "assets/i18n/language_codes.json",
    );
    Map<String, dynamic> jsonCodes = json.decode(codes);
    final converted = Map<String, String>.from(
      jsonCodes.map(
        (key, value) => MapEntry(
          key,
          value.toString(),
        ),
      ),
    );
    return converted;
  }
}
