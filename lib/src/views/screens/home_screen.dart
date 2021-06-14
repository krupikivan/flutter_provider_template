import 'package:flutter/material.dart';
import 'package:flutter_provider_template/src/model/apis/api_response.dart';
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
          title: Consumer<PostViewModel>(
              builder: (context, value, _) =>
                  value.status == PostStatus.Fetching
                      ? Text("Loading")
                      : Text("Post count: ${value.post?.length}")),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => postViewModel.addPost(),
          child: Icon(Icons.add),
        ),
        body: getPostWidget(postViewModel.response, context));
  }

  getPostWidget(ApiResponse apiResponse, context) {
    final postViewModel = Provider.of<PostViewModel>(context);

    switch (apiResponse.status) {
      case Status.INITIAL:
        postViewModel.getAllPosts();
        return LoadingWidget();
      case Status.COMPLETED:
        return FetchPostScreen();
      case Status.LOADING:
        return LoadingWidget();
      case Status.ERROR:
        return ErrorPostScreen();
      default:
        return LoadingWidget();
    }
  }
}
