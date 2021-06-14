import 'package:flutter_provider_template/src/model/constants/endpoint.dart';
import 'package:flutter_provider_template/src/model/constants/string.dart';
import 'package:flutter_provider_template/src/model/service/implement/base_service.dart';
import 'package:flutter_provider_template/src/model/service/implement/post_service.dart';
import 'package:intl/intl.dart';
import '../../post.dart';

class PostRepository {
  BaseService _postService = PostService();

  Future<List<Post>> getAllPosts() async {
    final List<Post> response =
        await _postService.getResponse(Endpoint.getAllPosts);

    return response;
  }

  Future<Post> savePost() async {
    Post post = Post(
        id: DateTime.now().millisecondsSinceEpoch,
        text: "New post at ${DateTime.now().millisecondsSinceEpoch}",
        creationDate: DateFormat(commonDateFormat).format(DateTime.now()));
    final Post response = await _postService.savePost(Endpoint.savePost, post);

    return response;
  }
}
