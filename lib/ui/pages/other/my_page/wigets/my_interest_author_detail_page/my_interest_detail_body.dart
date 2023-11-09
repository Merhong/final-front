import 'package:flutter/material.dart';
import 'package:flutter_blog/data/dto/user_dto/interest_author_detail_DTO.dart';
import 'package:flutter_blog/ui/pages/other/my_page/my_interest_author_detail_view_model.dart';
import 'package:flutter_blog/ui/pages/other/my_page/wigets/my_interest_author_detail_page/my_interest_author_detail_art.dart';
import 'package:flutter_blog/ui/pages/other/my_page/wigets/my_interest_author_detail_page/my_interest_author_detail_board.dart';
import 'package:flutter_blog/ui/pages/other/my_page/wigets/my_interest_author_detail_page/my_interest_author_detail_info.dart';
import 'package:flutter_blog/ui/pages/other/my_page/wigets/my_interest_author_detail_page/my_interest_author_detail_middle_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyInterestAuthorDetailBody extends ConsumerWidget {
  MyInterestAuthorDetailBody({Key? key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    MyAuthorDetailPageModel? model = ref.watch(myAuthorDetailPageProvider);
    if (model == null) {
      return Center(child: CircularProgressIndicator());
    }
    InterestAuthorDetailDTO interestAuthorDetailDTO = model.interestAuthorDetailDTO;

    return CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: MyInterestAuthorDetailInfo(interestAuthorDetailDTO),
        ),
        SliverToBoxAdapter(
          child: MyInterestAuthorDetailMiddleBar(interestAuthorDetailDTO),
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
