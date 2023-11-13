import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/my_color.dart';

class CurrentCookie extends StatefulWidget {
  @override
  CurrentCookieState createState() => CurrentCookieState();
}

class CurrentCookieState extends State<CurrentCookie> {
  int _cookieCount = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      child: Padding(
        padding: const EdgeInsets.all(13.0),
        child: Row(
          children: [
            Icon(
              Icons.cookie,
              color: Colors.orange,
            ),
            SizedBox(
              width: 5.0, // sizeS5 대신 고정 값 사용
            ),
            Text("현재 보유한 쿠키"),
            SizedBox(
              width: 5.0, // sizeS5 대신 고정 값 사용
            ),
            Text("$_cookieCount개", style: TextStyle(color: CommonColors.green)),
          ],
        ),
      ),
    );
  }

  // 쿠키 수를 업데이트하는 메서드
  void updateCookieCount(int newCount) {
    setState(() {
      _cookieCount = newCount;
    });
  }
}
