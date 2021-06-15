import 'package:dio/dio.dart';
import 'package:flutter_provider_template/src/model/constants/endpoint.dart';
import 'package:flutter_provider_template/src/model/constants/string.dart';
import 'package:intl/intl.dart';
import '../../post.dart';
import '../ipost_repository.dart';

class PostsRepository implements IPostsRepository {
  PostsRepository({required this.http});
  final Dio http;

  Future<List<Post>> getAllPosts() async {
    final Response response = await http.get(Endpoint.getAllPosts);
    final List<dynamic> resList = response.data;
    final List<Post> posts =
        resList.map((dynamic post) => Post.fromJson(post)).toList();
    return posts;
  }

  @override
  Future<Post> savePost(Post post) async {
    Post newPost = Post(
        id: DateTime.now().millisecondsSinceEpoch,
        text: post.text,
        creationDate: DateFormat(commonDateFormat).format(DateTime.now()));
    final Response response =
        await http.post(Endpoint.savePost, data: newPost.toJson());

    return response.data;
  }
}
