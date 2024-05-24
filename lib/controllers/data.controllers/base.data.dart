
import 'package:flutter/services.dart';
import 'package:starter/controllers/api.controllers/base.api.dart';

abstract class BaseData {
  BaseData({
    required this.api,
    required this.notify,
  });

  final BaseApi api;
  final VoidCallback notify;
}