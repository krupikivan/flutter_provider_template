import 'package:flutter/material.dart';
import 'package:flutter_provider_template/src/view_model/posts_view_model.dart';
import 'package:provider/provider.dart';

/// Success view afetr success to get the posts or make any post
class FetchPostScreen extends StatelessWidget {
  const FetchPostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PostsViewModel>(
        builder: (context, postsController, _) => RefreshIndicator(
              onRefresh: () => postsController.getAllPosts(),
              child: ListView.separated(
                separatorBuilder: (context, index) =>
                    Divider(color: Colors.black45),
                itemCount: postsController.posts.length,
                itemBuilder: (context, index) => SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      postsController.posts[index].text!,
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
              ),
            ));
  }
}
