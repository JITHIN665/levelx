import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:levelx/infrastructure/notifier/post_notifier.dart';
import 'package:levelx/modules/home/widgets/custom_appbar.dart';
import 'package:levelx/modules/home/widgets/post_item.dart';
import 'package:levelx/modules/home/widgets/tab_selector.dart';
import 'package:levelx/theme/app_theme.dart';
import 'package:levelx/theme/app_transition.dart';

class PostListView extends ConsumerStatefulWidget {
  const PostListView({super.key});

  static Route route() {
    return AppFadeTransition(page: const PostListView());
  }

  @override
  ConsumerState<PostListView> createState() => _PostListViewState();
}

class _PostListViewState extends ConsumerState<PostListView> {
  final ScrollController _controller = ScrollController();
  String selectedTab = 'Trending';

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onScroll);
  }

  void _onScroll() {
    final notifier = ref.read(postNotifierProvider.notifier);
    if (_controller.position.pixels >= _controller.position.maxScrollExtent - 200 && notifier.hasMore && selectedTab == 'Trending') {
      notifier.fetchPosts();
    }
  }

  @override
  Widget build(BuildContext context) {
    final postState = ref.watch(postNotifierProvider);
    final notifier = ref.read(postNotifierProvider.notifier);

    return Scaffold(
      backgroundColor: appColor(context).background,
      appBar: CustomAppbar(title: "Social Media Posts"),
      body: Column(
        children: [
          TabSelector(
            selectedTab: selectedTab,
            onTabChanged: (tab) {
              setState(() {
                selectedTab = tab;
                if (tab == 'Trending') {
                  notifier.fetchPosts(isRefresh: true);
                }
              });
            },
          ),
          Expanded(
            child:
                selectedTab != 'Trending'
                    ? const Center(child: Text("No posts available"))
                    : RefreshIndicator(
                      onRefresh: () => notifier.fetchPosts(isRefresh: true),
                      child: postState.when(
                        data:
                            (posts) => ListView.separated(
                              separatorBuilder:
                                  (c, i) => Divider(height: .5, color: appColor(context).gridColor!.withOpacity(.4), indent: 16, endIndent: 16),
                              controller: _controller,
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              itemCount: posts.length,
                              itemBuilder: (_, index) => PostItem(post: posts[index]),
                            ),
                        loading: () => const Center(child: CircularProgressIndicator()),
                        error: (e, _) => Center(child: Text('Error: $e')),
                      ),
                    ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
