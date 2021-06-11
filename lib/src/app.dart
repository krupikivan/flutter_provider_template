import 'package:flutter/material.dart';
import 'package:flutter_provider_template/src/model/constants/string.dart';
import 'package:flutter_provider_template/src/views/screens/home_screen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appName,
      home: HomeScreen(),
    );
  }
}
