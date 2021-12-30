import 'package:flutter_bloc_post/models/post_molde.dart';
import 'package:flutter_bloc_post/services/psot_services.dart';

class PostRepository {
  final postService = PostService();
  Future<List<PostModel>> getPosts() async {
    final List<PostModel> posts = await postService.getPosts();
    return posts;
  }
}
