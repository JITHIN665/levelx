import 'package:flutter/material.dart';
import 'package:levelx/theme/app_theme.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppbar({super.key, required this.title});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 25);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: appColor(context).background,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 40, 16, 0),
            child: SizedBox(
              height: 40,
              child: Row(
                children: [
                  CircleAvatar(radius: 20, backgroundImage: AssetImage("assets/images/user_1.png")),
                  const Spacer(),
                  Image.asset("assets/icon/notification.png", height: 25),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 5),
            child: Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: appColor(context).primaryText)),
          ),
        ],
      ),
    );
  }
}
