import 'package:flutter/material.dart';
import 'config/dependencies.dart';
import 'core/presentation/app.dart';

Future<void> main() async {

  // Load dependencies
  loadDependencies();

  runApp(const App());
}
