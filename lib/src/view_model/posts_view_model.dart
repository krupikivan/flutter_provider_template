import 'package:flutter/cupertino.dart';
import 'package:flutter_provider_template/src/model/post.dart';
import 'package:flutter_provider_template/src/model/repository/implement/posts_repository.dart';
import 'package:flutter_provider_template/src/model/repository/ipost_repository.dart';

enum PostsStatus { Initial, Fetching, Fetch, Error }

class PostsViewModel with ChangeNotifier {
  PostsViewModel({required this.repository});
  List<Post> _posts = const []; //CHECK THE CONST

  PostsStatus _status = PostsStatus.Initial;
  final IPostsRepository repository;

  List<Post> get posts {
    return _posts;
  }

  PostsStatus get status {
    return _status;
  }

  /// Method to call all posts, normally call in initial state
  Future<void> getAllPosts() async {
    _status = PostsStatus.Fetching;
    notifyListeners();
    try {
      final List<Post> posts = await repository.getAllPosts();
      await Future<dynamic>.delayed(Duration(seconds: 2));
      _posts = posts;
      _status = PostsStatus.Fetch;
    } catch (e) {
      _status = PostsStatus.Error;
    }
    notifyListeners();
  }

  Future<void> addPost(String text) async {
    _status = PostsStatus.Fetching;
    notifyListeners();
    try {
      await repository.savePost(Post(text: text));
      await Future<dynamic>.delayed(Duration(seconds: 2));
      getAllPosts();
    } catch (e) {
      _status = PostsStatus.Error;
    }
  }
}
