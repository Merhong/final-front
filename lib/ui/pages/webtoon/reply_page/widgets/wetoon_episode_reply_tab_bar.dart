import 'package:flutter/material.dart';

class WebtoonReplyTabBar extends StatefulWidget {
  const WebtoonReplyTabBar({Key? key}) : super(key: key);

  @override
  State<WebtoonReplyTabBar> createState() => _ReplyTabBarState();
}

class _ReplyTabBarState extends State<WebtoonReplyTabBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this); // 탭의 개수 설정
  }

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: _tabController,
      tabs: [
        Tab(
          text: '베스트 댓글',
        ),
        Tab(text: '댓글 '),
      ],
      labelColor: Colors.green,
      unselectedLabelColor: Colors.black,
    );
  }

  @override
  void dispose() {
    _tabController.dispose(); // TabController 해제
    super.dispose();
  }
}
