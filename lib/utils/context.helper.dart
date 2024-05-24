import 'package:flutter/material.dart';

class ContextHelper {
  static final navigatorKey = GlobalKey<NavigatorState>();

  static Future<BuildContext> get context async {
    while (navigatorKey.currentContext == null) {
      await Future.delayed(kTabScrollDuration);
      
    }
    return navigatorKey.currentContext!;
  }
}
