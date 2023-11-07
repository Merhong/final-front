import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/pages/other/my_page/wigets/my_interest_author_detail_page/my_interest_author_detail_art.dart';
import 'package:flutter_blog/ui/pages/other/my_page/wigets/my_interest_author_detail_page/my_interest_author_detail_board.dart';
import 'package:flutter_blog/ui/pages/other/my_page/wigets/my_interest_author_detail_page/my_interest_author_detail_info.dart';
import 'package:flutter_blog/ui/pages/other/my_page/wigets/my_interest_author_detail_page/my_interest_author_detail_middle_bar.dart';

class MyInterestAuthorDetailBody extends StatelessWidget {
  // final List<String> items =
  //     List<String>.generate(100, (index) => "Item $index");
  MyInterestAuthorDetailBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: Column(
            children: [
              MyInterestAuthorDetailInfo(),
              MyInterestAuthorDetailMiddleBar(),
              SizedBox(
                height: 10,
              ),
              MyInterestAuthorDetailArt(),
              SizedBox(
                height: 10,
              ),
              MyInterestAuthorDetailBoard(),
            ],
          ),
        )
      ],
    );
  }
}
