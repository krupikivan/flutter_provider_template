import 'package:flutter_provider_template/src/model/constants/endpoint.dart';
import 'package:flutter_provider_template/src/model/service/implement/base_service.dart';
import 'package:flutter_provider_template/src/model/service/implement/post_service.dart';
import '../../post.dart';

/// Repository to model the data before send to the service pattern to make request
class PostRepository {
  BaseService _postService = PostService();

  Future<List<Post>> getAllPosts() async {
    final List<Post> response =
        await _postService.getResponse(Endpoint.getAllPosts);

    return response;
  }

  // Future<Post> savePost(Post post) async {
  //   post.creationDate = DateFormat(commonDateFormat).format(DateTime.now());

  //   final Response<dynamic>? response = await _postService.savePost(post);

  //   return Post.fromJson(response!.data! as Map<String, dynamic>);
  // }
}
