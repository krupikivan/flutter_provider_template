import 'package:flutter/material.dart';
import 'package:flutter_provider_template/src/view_model/post_view_model.dart';
import 'package:provider/provider.dart';

/// Success view afetr success to get the posts or make any post
class FetchPostScreen extends StatelessWidget {
  const FetchPostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PostViewModel>(
      builder: (context, value, ___) => RefreshIndicator(
        onRefresh: () => value.getAllPosts(),
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List<Widget>.generate(
                value.post!.length,
                (int index) => Container(
                      child: Column(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: Text(
                                value.post![index].text!,
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
