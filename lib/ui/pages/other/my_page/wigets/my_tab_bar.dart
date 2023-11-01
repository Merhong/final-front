import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/pages/other/my_page/my_interest_author_view_model.dart';
import 'package:flutter_blog/ui/pages/other/my_page/my_interest_webtoon_view_model.dart';
import 'package:flutter_blog/ui/pages/other/my_page/wigets/my_comment.dart';
import 'package:flutter_blog/ui/pages/other/my_page/wigets/my_interest_author.dart';
import 'package:flutter_blog/ui/pages/other/my_page/wigets/my_interest_webtoon.dart';
import 'package:flutter_blog/ui/pages/other/my_page/wigets/my_recently_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyTabBar extends ConsumerWidget {
  const MyTabBar({
    super.key,
    required TabController? tabController,
  }) : _tabController = tabController;

  final TabController? _tabController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        TabBar(
          controller: _tabController,
          tabs: <Widget>[
            Tab(
              child: Text(
                "관심작가",
                style: TextStyle(
                  color: Colors.black, // 텍스트 색상을 검은색으로 설정
                  fontWeight: FontWeight.bold, // 텍스트를 굵게 만듭니다
                ),
              ),
            ),
            Tab(
              child: Text(
                "관심웹툰",
                style: TextStyle(
                  color: Colors.black, // 텍스트 색상을 검은색으로 설정
                  fontWeight: FontWeight.bold, // 텍스트를 굵게 만듭니다
                ),
              ),
            ),
            Tab(
              child: Text(
                "최근 본",
                style: TextStyle(
                  color: Colors.black, // 텍스트 색상을 검은색으로 설정
                  fontWeight: FontWeight.bold, // 텍스트를 굵게 만듭니다
                ),
              ),
            ),
            Tab(
              child: Text(
                "댓글",
                style: TextStyle(
                  color: Colors.black, // 텍스트 색상을 검은색으로 설정
                  fontWeight: FontWeight.bold, // 텍스트를 굵게 만듭니다
                ),
              ),
            ),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              RefreshIndicator(
                  onRefresh: () async {
                    await ref.read(myAuthorPageProvider.notifier).notifyInit();
                  },
                  child: MyInterestAuthor()),
              RefreshIndicator(
                  onRefresh: () async {
                    await ref.read(myWebtoonPageProvider.notifier).notifyInit();
                  },
                  child: MyInterestWebtoon()),
              MyRecentlyView(),
              MyComment(),
            ],
          ),
        )
      ],
    );
  }
}
