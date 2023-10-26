import 'package:flutter/material.dart';

class WebtoonEpisodeAppBar extends StatelessWidget implements PreferredSizeWidget {
  String title;

  WebtoonEpisodeAppBar(this.title);

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // leading: IconButton(
      //   icon: Icon(Icons.view_list, color: Colors.white),
      //   onPressed: () {
      //     // 댓글 아이콘을 눌렀을 때 수행할 작업 추가
      //   },
      // ),
      title: Text(
        "${title}",
        style: TextStyle(color: Colors.white),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.bookmark, color: Colors.white),
          onPressed: () {
            // 댓글 아이콘을 눌렀을 때 수행할 작업 추가
          },
        ),
      ],
      backgroundColor: Colors.black,
    );
  }
}
