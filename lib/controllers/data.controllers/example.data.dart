import 'package:shared_preferences/shared_preferences.dart';
import 'package:starter/controllers/api.controllers/example.api.dart';
import 'package:starter/controllers/data.controllers/base.data.dart';

class ExampleData extends BaseData {
  ExampleData({
    required super.api,
    required super.notify,
    required this.pref,
  }) : _api = api as ExampleApi {
    _init();
  }
  // ignore: unused_field
  late final ExampleApi _api;
  final SharedPreferences pref;

  void _init() async {}

  //ready-to-implemet
  // Future<void> login({
  //   required String email,
  //   required String password,
  // }) async {
  //   user = await _api.login(
  //     email: email,
  //     password: password,
  //   );
  //   uid = user?.id;
  //   notify.call();
  //   if (user == null) {
  //     throw "Kullanıcı bulunamadı";
  //   }
  // }
}
