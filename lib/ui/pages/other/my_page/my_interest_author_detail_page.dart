import 'package:flutter/material.dart';
import 'package:flutter_blog/data/dto/user_dto/interest_author_detail_DTO.dart';
import 'package:flutter_blog/ui/pages/other/my_page/my_interest_author_detail_view_model.dart';
import 'package:flutter_blog/ui/pages/other/my_page/wigets/my_interest_author_detail_page/my_interest_author_detail_appbar.dart';
import 'package:flutter_blog/ui/pages/other/my_page/wigets/my_interest_author_detail_page/my_interest_detail_body.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyInterestAuthorDetailPage extends StatelessWidget {
  const MyInterestAuthorDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyInterestAuthorDetailAppBar(),
      body: MyInterestAuthorDetailBody(),
    );
  }
}
