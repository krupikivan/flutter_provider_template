class Endpoint {
  // static const String url = 'http://10.0.2.2:3004';
  static const String url = 'http://localhost:3000';

  static const String getAllPosts = '$url/posts';
  static String getPostById(String id) => '$url/posts/$id';
  static const String savePost = '$url/posts';
}
