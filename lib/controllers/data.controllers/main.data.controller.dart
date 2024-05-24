import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:starter/controllers/api.controllers/main.api.controller.dart';
import 'package:starter/controllers/data.controllers/example.data.dart';

class MainDataController extends ChangeNotifier {
  MainDataController() {
    _init();
  }

  SharedPreferences? _pref;
  MainApiController? _api;

  ExampleData? example;

  void _init() async {
    _pref ??= await SharedPreferences.getInstance();
    _api ??= MainApiController(_pref!);
    example = ExampleData(
      api: _api!.account,
      notify: notifyListeners,
      pref: _pref!,
    );
    notifyListeners();
  }
}
