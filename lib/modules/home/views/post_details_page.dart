import 'package:flutter/material.dart';
import 'package:levelx/infrastructure/model/post.dart';
import 'package:levelx/theme/app_theme.dart';
import 'package:levelx/theme/app_transition.dart';

class PostDetailsPage extends StatelessWidget {
  final Post post;
  const PostDetailsPage({super.key, required this.post});

  static Route route(Post post) {
    return AppFadeTransition(page: PostDetailsPage(post: post));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(post.title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: appColor(context).primaryText)),
            SizedBox(height: 15),
            Text(post.body, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: appColor(context).secondaryText)),
          ],
        ),
      ),
    );
  }
}
