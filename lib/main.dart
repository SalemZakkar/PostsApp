import 'package:flutter/material.dart';

import 'app.dart';
import 'injection.dart';

void main() {
  configureInjection("dev");
  runApp(const MyApp());
}
