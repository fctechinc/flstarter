import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:starter/screens/base.screen.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final Object? arguments = _getAruguments(settings);

    return _routeSwitcher(
      name: settings.name?.split('?').first,
      arguments: arguments,
    );
  }

  static Object? _getAruguments(RouteSettings settings) {
    final webArg = Map<String, String>.from(Uri.base.queryParameters);
    Object? arguments = settings.arguments;

    if (kIsWeb && arguments == null && webArg.isNotEmpty) {
      arguments = webArg;
    }
    return arguments;
  }

  static Route<dynamic> _routeSwitcher({
    required String? name,
    Object? arguments,
  }) {
    switch (name) {
      case BaseScreen.id:
        return _route(
          const BaseScreen(),
        );

      default:
        return _route(
          const Scaffold(
            body: Center(
              child: Text(
                "Not Found",
              ),
            ),
          ),
        );
    }
  }

  static MaterialPageRoute _route(Widget page) {
    return MaterialPageRoute(
      builder: (_) => page,
    );
  }
}
