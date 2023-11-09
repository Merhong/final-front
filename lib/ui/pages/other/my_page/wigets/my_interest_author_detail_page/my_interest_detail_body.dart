import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/pages/other/my_page/wigets/my_interest_author_detail_page/my_interest_author_detail_art.dart';
import 'package:flutter_blog/ui/pages/other/my_page/wigets/my_interest_author_detail_page/my_interest_author_detail_board.dart';
import 'package:flutter_blog/ui/pages/other/my_page/wigets/my_interest_author_detail_page/my_interest_author_detail_info.dart';
import 'package:flutter_blog/ui/pages/other/my_page/wigets/my_interest_author_detail_page/my_interest_author_detail_middle_bar.dart';

class MyInterestAuthorDetailBody extends StatelessWidget {
  MyInterestAuthorDetailBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        MyInterestAuthorDetailInfo(),
        MyInterestAuthorDetailMiddleBar(),
        SizedBox(
          height: 10,
        ),
        MyInterestAuthorDetailArt(),
        MyInterestAuthorDetailBoard(),
      ],
    );
  }
}
