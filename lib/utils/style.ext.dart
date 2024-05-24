import 'package:flutter/material.dart';

extension StyleExtension on BuildContext {
  TextStyle? get title => Theme.of(this).textTheme.headlineMedium?.copyWith(
        fontWeight: FontWeight.bold,
      );
  TextStyle? get subtitle => Theme.of(this).textTheme.bodyLarge?.copyWith(
        fontWeight: FontWeight.bold,
      );

  TextStyle? get normal => Theme.of(this).textTheme.bodyMedium;

  TextStyle? get bold => normal?.copyWith(fontWeight: FontWeight.bold);

  TextStyle? get thin => Theme.of(this).textTheme.bodySmall;
}
