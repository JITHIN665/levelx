import 'package:flutter/material.dart';
import 'package:levelx/infrastructure/model/post.dart';
import 'package:levelx/modules/home/views/post_details_page.dart';
import 'package:levelx/theme/app_theme.dart';

class PostItem extends StatelessWidget {
  final Post post;
  const PostItem({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => PostDetailsPage(post: post))),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CircleAvatar(radius: 20, backgroundImage: AssetImage('assets/images/user_2.png')),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      post.title,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontWeight: FontWeight.w600, color: appColor(context).secondaryText),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Image.asset('assets/icon/like.png', height: 20),
                        const SizedBox(width: 6),
                        const Text('2'),
                        const SizedBox(width: 34),
                        Image.asset('assets/icon/comment.png', height: 20),
                        Spacer(),
                        Image.asset('assets/icon/share.png', height: 20),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
