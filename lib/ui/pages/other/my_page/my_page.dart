import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/common_widgets/myapp_appbar.dart';
import 'package:flutter_blog/ui/pages/other/my_page/wigets/my_body_tab_bar.dart';

void main() {
  runApp(MyPage());
}

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: MyappAppbar(),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 17), // 양쪽 여백을 17로 설정
          child: MyBodyTabBar(),
        ),
      ),
    );
  }
}
