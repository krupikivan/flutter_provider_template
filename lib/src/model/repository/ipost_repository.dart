import 'package:flutter_provider_template/src/model/post.dart';

abstract class IPostsRepository {
  Future<List<Post>> getAllPosts();
  Future<Post> savePost(Post post);
}
