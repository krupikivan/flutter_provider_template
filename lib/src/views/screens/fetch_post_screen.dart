import 'package:flutter/material.dart';
import 'package:flutter_provider_template/src/model/post.dart';
import 'package:flutter_provider_template/src/view_model/post_view_model.dart';
import 'package:provider/provider.dart';

/// Success view afetr success to get the posts or make any post
class FetchPostScreen extends StatelessWidget {
  const FetchPostScreen({Key? key, this.posts}) : super(key: key);

  final List<Post>? posts;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () =>
          Provider.of<PostViewModel>(context, listen: false).getAllPosts(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List<Widget>.generate(
                posts!.length,
                (int index) => Container(
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(width: 10, color: Colors.black))),
                      child: SizedBox(
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Text(
                            posts![index].text!,
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                    )),
          ),
        ),
      ),
    );
  }
}
