import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_provider_template/src/model/constants/string.dart';
import 'package:flutter_provider_template/src/view_model/posts_view_model.dart';
import 'package:flutter_provider_template/src/views/screens/home_screen.dart';
import 'package:provider/provider.dart';

import 'model/repository/implement/posts_repository.dart';
import 'model/repository/ipost_repository.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final IPostsRepository postsRepository = PostsRepository(http: Dio());

    return ChangeNotifierProvider(
      create: (context) => PostsViewModel(repository: postsRepository),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: appName,
        home: HomeScreen(),
      ),
    );
  }
}
