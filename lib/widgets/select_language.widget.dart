import 'package:flutter/material.dart';
import 'package:starter/i18n/applocalizations.dart';
import 'package:starter/i18n/i18n_asset_loader.dart';

class SelectLanguageWidget extends StatelessWidget {
  SelectLanguageWidget({
    super.key,
    this.iconSize,
    this.stateSetter,
    this.call,
  });

  final double? iconSize;
  final StateSetter? stateSetter;
  final VoidCallback? call;

  final _key = GlobalKey<PopupMenuButtonState>();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, String>>(
      future: I18nAssetLoader.languageCodes,
      builder: (context, snapshot) {
        return ClipOval(
          child: PopupMenuButton<String>(
              shadowColor: Colors.transparent,
              padding: EdgeInsets.zero,
              elevation: 0,
              surfaceTintColor: Colors.transparent,
              key: _key,
              onSelected: (value) async {
                if (!snapshot.hasData) return;
                final langCodes = snapshot.data!.entries.where(
                  (e) => e.value == value,
                );
                if (langCodes.isNotEmpty) {
                  try {
                    await AppLocalizations.instance.changeLanguage(
                      langCodes.single.key,
                    );
                    if (stateSetter != null) {
                      stateSetter!(() {});
                    }
                    if (call != null) {
                      call?.call();
                    }
                  } catch (_) {}
                }
              },
              iconSize: iconSize,
              enabled: false,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              constraints: const BoxConstraints(),
              itemBuilder: (context) {
                return snapshot.data?.entries
                        .map(
                          (e) => PopupMenuItem<String>(
                            enabled:
                                AppLocalizations.instance.locale.languageCode !=
                                    e.key,
                            value: e.value,
                            child: Center(
                              child: Text(
                                e.value,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        )
                        .toList() ??
                    [];
              },
              tooltip: "Select Language",
              icon: TextButton.icon(
                onPressed: () {
                  _key.currentState?.showButtonMenu();
                },
                label: Text(
                  snapshot.data?[
                          AppLocalizations.instance.locale.languageCode] ??
                      "Select Language",
                ),
                icon: const Icon(
                  Icons.language_rounded,
                ),
              )),
        );
      },
    );
  }
}
