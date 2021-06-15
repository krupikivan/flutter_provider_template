import 'package:flutter/material.dart';
import 'package:flutter_provider_template/src/model/repository/ipost_repository.dart';
import 'src/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  /// Inject global providers before the widget tree
  runApp(const App());
}
