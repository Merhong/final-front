import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/common_widgets/app_bottom.dart';
import 'package:flutter_blog/ui/pages/other/see_more_page/widgets/see_more_body.dart';

class SeeMorePage extends StatelessWidget {
  const SeeMorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AppBottom(),
      appBar: SeeMoreAppBar(),
      body: SeeMoreBody(),
    );
  }
}

AppBar SeeMoreAppBar() {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 1,
    title: Text(
      '더보기',
      style: TextStyle(color: Colors.black),
    ), // AppBar의 제목을 설정
    centerTitle: true, // 제목을 가운데 정렬
  );
}
