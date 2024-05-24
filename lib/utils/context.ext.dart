import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:starter/utils/navigator.ext.dart';
import 'package:starter/utils/style.ext.dart';

extension ContextExtension on BuildContext {
  Size get cSize => MediaQuery.sizeOf(this);

  double get width => cSize.width;

  double get height => cSize.height;

  double dynamicWidth(double val) => width * val;

  double dynamicHeight(double val) => height * val;

  void unFocus() {
    FocusScopeNode currentFocus = FocusScope.of(this);

    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  void nextFocus() {
    FocusScopeNode currentFocus = FocusScope.of(this);

    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.nextFocus();
    }
  }

  void focus() {
    FocusScopeNode currentFocus = FocusScope.of(this);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.requestFocus();
    }
  }

  Future<bool?> dialog({
    String? title,
    required String message,
    bool requestPermission = false,
  }) {
    final titleWidget = title != null ? Text(title) : null;
    final messageWidget = Text(message);
    final actions = [
      if (requestPermission) ...[
        if (defaultTargetPlatform == TargetPlatform.iOS ||
            defaultTargetPlatform == TargetPlatform.macOS)
          CupertinoDialogAction(
            isDestructiveAction: true,
            onPressed: back,
            child: Text(
              "İptal",
              style: normal?.copyWith(
                color: Colors.red,
              ),
            ),
          )
        else
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.red,
            ),
            onPressed: back,
            child: const Text("İptal"),
          )
      ],
      if (defaultTargetPlatform == TargetPlatform.iOS ||
          defaultTargetPlatform == TargetPlatform.macOS)
        CupertinoDialogAction(
          child: const Text("Tamam"),
          onPressed: () {
            back(true);
          },
        )
      else
        TextButton(
          child: const Text("Tamam"),
          onPressed: () {
            back(true);
          },
        ),
    ];
    return showAdaptiveDialog<bool?>(
      context: this,
      builder: (c) {
        if (defaultTargetPlatform == TargetPlatform.iOS ||
            defaultTargetPlatform == TargetPlatform.macOS) {
          return CupertinoAlertDialog(
            title: titleWidget,
            content: messageWidget,
            actions: actions,
          );
        }
        return AlertDialog(
          title: titleWidget,
          content: messageWidget,
          actions: actions,
        );
      },
    );
  }

  Future<T?> wait<T extends Object?>(
    Future<T?>? func, {
    String? message,
  }) async {
    if (func == null) return null;
    showGeneralDialog(
      context: this,
      pageBuilder: (a, b, c) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircularProgressIndicator.adaptive(),
              if (message != null) ...[
                const SizedBox(
                  height: 20,
                ),
                Text(
                  message,
                  style: a.normal?.copyWith(
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                )
              ]
            ],
          ),
        );
      },
    );
    T? result;
    try {
      result = await func;
      back();
    } catch (e) {
      back();
      rethrow;
    }

    return result;
  }
}
