import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_provider_template/src/model/apis/app_exception.dart';
import 'package:flutter_provider_template/src/model/constants/endpoint.dart';
import 'package:flutter_provider_template/src/model/service/implement/base_service.dart';

import '../../post.dart';

class PostService extends BaseService {
  final Dio http = Dio();

  @override
  Future<Post> savePost(String url, Post post) async {
    try {
      final response = await http.post(Endpoint.savePost, data: post.toJson());
      return Post.fromJson(response.data);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
  }

  @override
  Future<List<Post>> getResponse() async {
    try {
      final response = await http.get(Endpoint.getAllPosts);
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
