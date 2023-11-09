import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/pages/other/my_page/wigets/my_interest_author_detail_page/my_interest_author_detail_art.dart';
import 'package:flutter_blog/ui/pages/other/my_page/wigets/my_interest_author_detail_page/my_interest_author_detail_board.dart';
import 'package:flutter_blog/ui/pages/other/my_page/wigets/my_interest_author_detail_page/my_interest_author_detail_info.dart';
import 'package:flutter_blog/ui/pages/other/my_page/wigets/my_interest_author_detail_page/my_interest_author_detail_middle_bar.dart';

class MyInterestAuthorDetailBody extends StatelessWidget {
  MyInterestAuthorDetailBody({Key? key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: MyInterestAuthorDetailInfo(),
        ),
        SliverToBoxAdapter(
          child: MyInterestAuthorDetailMiddleBar(),
        ),
        SliverToBoxAdapter(
          child: MyInterestAuthorDetailArt(),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return MyInterestAuthorDetailBoard(); // MyInterestAuthorDetailBoard 위젯 추가
            },
            childCount: 10, // 아이템 개수
          ),
        ),
      ],
    );
  }
}
