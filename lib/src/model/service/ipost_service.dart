import 'package:dio/dio.dart';

import '../post.dart';

abstract class IPostService {
  Future<Response<List<dynamic>>> getAllPosts();
  Future<Response<Map<String, dynamic>>?> savePost(Post post);
}
