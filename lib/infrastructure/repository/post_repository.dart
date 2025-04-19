import 'package:levelx/infrastructure/model/post.dart';
import 'package:levelx/support/api_agent.dart';

class PostRepository {
  ///
  ///fetch Post data
  ///
  Future<List<Post>> fetchPosts({required int start, required int limit}) async {
    try {
      final response = await ApiAgent.get(url: 'posts', queryParams: {'_start': start, '_limit': limit});

      if (response.statusCode == 200) {
        final List data = response.data;
        return data.map((json) => Post.fromJson(json)).toList();
      } else {
        throw Exception('Failed with status: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Post fetch failed: $e');
    }
  }
}
