import 'package:ci_cd_lab/app_config.dart';
import 'package:ci_cd_lab/main.dart';
import 'package:flutter/material.dart';

void main() {
  final config = AppConfig(apiUrl: "https://staging.myapp.com");
  runApp(MyApp(config: config));
}
