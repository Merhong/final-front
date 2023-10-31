import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/pages/webtoon/reply_page/webtoon_reply_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReplyAppBar extends ConsumerWidget implements PreferredSizeWidget {
  int commentListSize;

  ReplyAppBar(this.commentListSize);

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      backgroundColor: Colors.black,
      title: Text("댓글 ${commentListSize}"),
      actions: [
        IconButton(
            onPressed: () async {
              await ref.read(webtoonReplyProvider.notifier).notifyInit();
            },
            icon: Icon(Icons.refresh)),
      ],
    );
  }
}
