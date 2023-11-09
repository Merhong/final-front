import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/pages/other/my_page/wigets/my_interest_author_detail_page/my_interest_author_detail_appbar.dart';
import 'package:flutter_blog/ui/pages/other/my_page/wigets/my_interest_author_detail_page/my_interest_detail_body.dart';

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
