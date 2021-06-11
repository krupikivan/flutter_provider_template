import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_provider_template/src/model/apis/app_exception.dart';
import 'package:flutter_provider_template/src/model/service/implement/base_service.dart';

import '../../post.dart';

class PostService extends BaseService {
  final Dio? http = Dio();

  // Future<Response<List<dynamic>>> getAllPosts() async {
  //   return http!.get(Endpoint.getAllPosts);
  // }

  // Future<Response<Map<String, dynamic>>?> savePost(Post post) {
  //   return http!.post(Endpoint.savePost, data: post.toJson());
  // }

  @override
  Future<List<Post>> getResponse(String url) async {
    try {
      final response = await http!.get(url);
      final List<dynamic> posts = response.data!;
      final List<Post> returnPosts = posts
          .map((dynamic post) => Post.fromJson(post as Map<String, dynamic>))
          .toList();
      return returnPosts;
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
  }
}
