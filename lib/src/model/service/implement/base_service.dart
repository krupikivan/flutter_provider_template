import '../../post.dart';

abstract class BaseService {
  Future<dynamic> getResponse();
  Future<dynamic> savePost(String url, Post post);
}
