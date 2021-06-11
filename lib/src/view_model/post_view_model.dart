import 'package:flutter/cupertino.dart';
import 'package:flutter_provider_template/src/model/apis/api_response.dart';
import 'package:flutter_provider_template/src/model/post.dart';
import 'package:flutter_provider_template/src/model/repository/implement/post_repository.dart';

enum PostStatus { Initial, Fetching, Fetch, Error }

class PostViewModel with ChangeNotifier {
  ApiResponse _apiResponse = ApiResponse.initial('Empty data');

  List<Post>? _post;

  PostStatus? _status = PostStatus.Initial;

  ApiResponse get response {
    return _apiResponse;
  }

  List<Post>? get post {
    return _post;
  }

  PostStatus? get status {
    return _status;
  }

  /// Method to call all posts, normally call in initial state
  Future<void> getAllPosts() async {
    _status = PostStatus.Fetching;
    _apiResponse = ApiResponse.loading('Fetching data');
    notifyListeners();
    try {
      final List<Post> posts = await PostRepository().getAllPosts();
      await Future<dynamic>.delayed(Duration(seconds: 2));
      _apiResponse = ApiResponse.completed(posts);
      _status = PostStatus.Fetch;
    } catch (e) {
      _apiResponse = ApiResponse.error(e.toString());
      _status = PostStatus.Error;
    }
    notifyListeners();
  }
}
