import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:starter/controllers/api.controllers/example.api.dart';
import 'package:starter/models/account.models/auth.model.dart';

class MainApiController {
  late final ExampleApi account;
  final ValueNotifier<Auth?> globalAuth = ValueNotifier(null);

  MainApiController(SharedPreferences pref) {
    account = ExampleApi(pref: pref, auth: globalAuth);
  }
}
