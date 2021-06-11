import 'package:flutter/material.dart';
import 'package:flutter_provider_template/src/model/apis/api_response.dart';
import 'package:flutter_provider_template/src/model/constants/string.dart';
import 'package:flutter_provider_template/src/model/post.dart';
import 'package:flutter_provider_template/src/view_model/post_view_model.dart';
import 'package:flutter_provider_template/src/view_model/post_view_model.dart';
import 'package:provider/provider.dart';

import 'error_post_screen.dart';
import 'fetch_post_screen.dart';
import '../widgets/loading_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final postViewModel = Provider.of<PostViewModel>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text(appName),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => postViewModel.getAllPosts(),
          child: Icon(Icons.add),
        ),
        body: getPostWidget(postViewModel.response));
  }

  getPostWidget(ApiResponse apiResponse) {
    List<Post>? postList = apiResponse.data as List<Post>?;
    switch (apiResponse.status) {
      case Status.INITIAL:
        return LoadingWidget();
      case Status.COMPLETED:
        return FetchPostScreen(posts: postList);
      case Status.LOADING:
        return LoadingWidget();
      case Status.ERROR:
        return ErrorPostScreen();
      default:
        return LoadingWidget();
    }
  }
}
