import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Loading layer to show posts
class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Platform.isAndroid
          ? const CircularProgressIndicator()
          : const CupertinoActivityIndicator(),
    );
  }
}
