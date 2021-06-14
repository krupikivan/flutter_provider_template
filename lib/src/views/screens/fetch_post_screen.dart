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
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List<Widget>.generate(
                //TODO Listview Builder
                postsController.posts.length,
                (int index) => Container(
                      child: Column(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: Text(
                                postsController.posts[index].text!,
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ),
                          Divider(
                            color: Colors.black45,
                          )
                        ],
                      ),
                    )),
          ),
        ),
      ),
    );
  }
}
