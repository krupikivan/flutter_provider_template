import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'src/app.dart';
import 'src/view_model/posts_view_model.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  /// Inject global providers before the widget tree
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider.value(value: PostsViewModel()),
  ], child: const App()));
}
