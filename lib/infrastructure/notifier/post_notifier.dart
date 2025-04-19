import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:levelx/infrastructure/model/post.dart';
import 'package:levelx/infrastructure/repository/post_repository.dart';

final postRepositoryProvider = Provider((ref) => PostRepository());

class PostNotifier extends AutoDisposeAsyncNotifier<List<Post>> {
  final int _limit = 20;
  bool _hasMore = true;
  int _currentStart = 0;

  @override
  Future<List<Post>> build() async {
    return await fetchPosts(isRefresh: true);
  }

  bool get hasMore => _hasMore;

  Future<List<Post>> fetchPosts({bool isRefresh = false}) async {
    if (isRefresh) {
      _currentStart = 0;
      _hasMore = true;
      state = const AsyncLoading();
    }

    if (!_hasMore) return state.value ?? [];

    try {
      final repository = ref.read(postRepositoryProvider);
      final newPosts = await repository.fetchPosts(start: _currentStart, limit: _limit);

      if (newPosts.length < _limit) _hasMore = false;

      final currentPosts = state.value ?? [];
      final updated = isRefresh ? newPosts : [...currentPosts, ...newPosts];
      state = AsyncData(updated);

      _currentStart += _limit;
      return updated;
    } catch (e, st) {
      state = AsyncError(e, st);
      return [];
    }
  }
}

final postNotifierProvider = AutoDisposeAsyncNotifierProvider<PostNotifier, List<Post>>(PostNotifier.new);
