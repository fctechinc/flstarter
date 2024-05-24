import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starter/controllers/data.controllers/main.data.controller.dart';

extension StateManagement on BuildContext {
  MainDataController data({bool listen = false}) {
    return Provider.of<MainDataController>(this, listen: listen);
  }
}
