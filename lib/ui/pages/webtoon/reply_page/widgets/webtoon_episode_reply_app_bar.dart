import 'package:flutter/material.dart';

class ReplyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final int commentAmount;
  const ReplyAppBar({Key? key, required this.commentAmount}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      // leading: IconButton(
      //   icon: Icon(Icons.close),
      //   onPressed: () {},
      // ),
      title: Text("댓글 ${commentAmount}"),
      actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.rocket)),
        IconButton(onPressed: () {}, icon: Icon(Icons.undo))
      ],
    );
  }
}
