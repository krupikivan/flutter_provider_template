import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_provider_template/src/model/repository/implement/posts_repository.dart';
import 'package:flutter_provider_template/src/model/repository/ipost_repository.dart';
import 'package:flutter_provider_template/src/view_model/posts_view_model.dart';
import 'package:provider/provider.dart';

import 'add_post_screen.dart';
import 'error_post_screen.dart';
import 'fetch_post_screen.dart';
import '../widgets/loading_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => addPostScreen(context),
          ),
        ],
        title: Consumer<PostsViewModel>(
            builder: (context, value, _) => value.status == PostsStatus.Fetching
                ? Text("Loading")
                : Text("Post count: ${value.posts.length}")),
      ),
      // body: SizedBox()),
      body: getPostWidget(context),
    );
  }

  getPostWidget(context) {
    final postViewModel = Provider.of<PostsViewModel>(context);

    switch (postViewModel.status) {
      case PostsStatus.Initial:
        postViewModel.getAllPosts();
        return LoadingWidget();
      case PostsStatus.Fetch:
        return FetchPostScreen();
      case PostsStatus.Fetching:
        return LoadingWidget();
      case PostsStatus.Error:
        return ErrorPostScreen();
      default:
        return LoadingWidget();
    }
  }
}
