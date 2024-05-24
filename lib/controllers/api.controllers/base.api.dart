import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'dart:developer' as dev;

import 'package:starter/models/account.models/auth.model.dart';
import 'package:starter/utils/constants.dart';

abstract class BaseApi {
  late final String path;
  late final String _service;
  late final Map<String, String> _baseHeaders;
  final ValueNotifier<Auth?> auth;

  BaseApi({
    required String service,
    required String subPath,
    required this.auth,
    required this.pref,
  }) : _service = service {
    path = "$apiBase/$subPath";
    _baseHeaders = {
      "Request-Service": _service,
    };
  }

  final SharedPreferences pref;

  Map<String, String> get headers => _baseHeaders;

  Future<void> updateAuth(
    String email,
    String password,
  ) async {
    const uri = "$apiBase/account/check-account-with-mail";
    final response = await http.post(
      Uri.parse(uri),
      body: json.encode(
        {
          "email": email,
          "password": password,
        },
      ),
      headers: {
        "Request-Service": "account",
      },
    );
    try {
      auth.value = Auth.fromJson(json.decode(response.body)["auth"]);
    } catch (e, s) {
      dev.log("$e\n\n StackTrace: $s", name: "updateAuth");
      rethrow;
    }
  }

  bool success(String body) => json.decode(body)?["success"] == true;
  bool success2(String body) => json.decode(body)?["status"] == true;

  Future<Map<String, String>> get headersWithToken async {
    final h = Map<String, String>.from(headers);
    final email = pref.getString("email");
    final password = pref.getString("pass");
    if (email == null || password == null) {
      return h;
    }
    if ((auth.value?.fetchedAt.difference(DateTime.now()).inMinutes.abs() ??
            60) >
        59) {
      await updateAuth(email, password);
    }

    if (auth.value != null) {
      h["Authorization"] = "Bearer ${auth.value!.token}";
    }
    return h;
  }
}
