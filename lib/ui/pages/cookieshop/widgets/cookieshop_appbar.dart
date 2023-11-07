import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/pages/other/see_more_page/see_more_page.dart';

AppBar cookieAppBar() {
  return AppBar(
      backgroundColor: Colors.white,
      leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Builder(
            builder: (context) => InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => SeeMorePage(),
                  ),
                );
              },
              child: Icon(Icons.arrow_back_ios, color: Colors.black),
            ),
          )),
      leadingWidth: 15.0,
      title: Center(
        child: Text(
          "쿠키샵",
          style: TextStyle(
            color: Colors.black,
            // 다른 스타일 속성을 필요에 따라 추가할 수 있습니다.
          ),
        ),
      ));
}
