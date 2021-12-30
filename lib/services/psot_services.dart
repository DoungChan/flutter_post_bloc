import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_bloc_post/models/post_molde.dart';

class PostService {
  Future<List<PostModel>> getPosts() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    http.Response response = await http.get(url);
    List listPost = jsonDecode(response.body);
    final posts =
        listPost.map((postjson) => PostModel.fromJson(postjson)).toList();
    return posts;
  }
}
