import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// Error widget to show in show when error is open
class ErrorPostScreen extends StatelessWidget {
  const ErrorPostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Icon(Icons.error),
          const SizedBox(height: 20),
          const Text('Error on post show'),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
