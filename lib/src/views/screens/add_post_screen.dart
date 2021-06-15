import 'package:flutter/material.dart';
import 'package:flutter_provider_template/src/view_model/posts_view_model.dart';
import 'package:provider/provider.dart';

Future<void> addPostScreen(context) async {
  final TextEditingController controller = TextEditingController();
  await showModalBottomSheet(
      context: context,
      builder: (BuildContext context) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: controller,
                  maxLines: 3,
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: () =>
                        Provider.of<PostsViewModel>(context, listen: false)
                            .addPost(controller.value.text),
                    child: const Text('Save post'),
                  ),
                ),
              ],
            ),
          ));
}
