import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/common_widgets/myapp_appbar.dart';
import 'package:flutter_blog/ui/pages/other/my_page/wigets/my_body_tab_bar.dart';

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: MyappAppbar(),
        body: MyBodyTabBar(),
      ),
    );
  }
}
