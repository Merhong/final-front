import 'package:flutter/material.dart';
import 'package:flutter_blog/data/dto/user_dto/interest_author_detail_DTO.dart';
import 'package:flutter_blog/data/provider/param_provider.dart';
import 'package:flutter_blog/ui/pages/other/author_page/my_interest_author_detail_page.dart';
import 'package:flutter_blog/ui/pages/other/author_page/my_interest_author_detail_view_model.dart';
import 'package:flutter_blog/ui/pages/other/author_page/widgets/my_interest_author_detail_art.dart';
import 'package:flutter_blog/ui/pages/other/author_page/widgets/my_interest_author_detail_board.dart';
import 'package:flutter_blog/ui/pages/other/author_page/widgets/my_interest_author_detail_info.dart';
import 'package:flutter_blog/ui/pages/other/author_page/widgets/my_interest_author_detail_middle_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyInterestAuthorDetailBody extends ConsumerStatefulWidget {
  MyInterestAuthorDetailBody({Key? key});

  @override
  _MyInterestAuthorDetailBodyState createState() => _MyInterestAuthorDetailBodyState();
}

class _MyInterestAuthorDetailBodyState extends ConsumerState<MyInterestAuthorDetailBody> {
  @override
  Widget build(BuildContext context) {
    MyAuthorDetailPageModel? model = ref.watch(myAuthorDetailPageProvider);
    if (model == null) {
      return Center(child: CircularProgressIndicator());
    }
    InterestAuthorDetailDTO interestAuthorDetailDTO = model.interestAuthorDetailDTO;

    if (interestAuthorDetailDTO.id != ref.read(paramProvider).authorMoveId) {
      ref.read(myAuthorDetailPageProvider.notifier).notifyInit();
    }

    return CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: MyInterestAuthorDetailInfo(interestAuthorDetailDTO),
        ),
        SliverToBoxAdapter(
          child: MyInterestAuthorDetailMiddleBar(interestAuthorDetailDTO),
        ),
        SliverToBoxAdapter(
          child: MyInterestAuthorDetailArt(interestAuthorDetailDTO),
        ),
        interestAuthorDetailDTO.authorBoardList!.length == 0
            ? SliverToBoxAdapter(child: Center(child: Text("${interestAuthorDetailDTO.authorNickname} 작가님의 글이 없어요.")))
            : SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return MyInterestAuthorDetailBoard(
                      interestAuthorDetailDTO.authorBoardList![index],
                      interestAuthorDetailDTO.authorNickname!,
                      interestAuthorDetailDTO.authorPhoto!,
                    ); // MyInterestAuthorDetailBoard 위젯 추가
                  },
                  childCount: interestAuthorDetailDTO.authorBoardList!.length, // 아이템 개수
                ),
              ),
      ],
    );
  }
}
