import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/pages/cookieshop/cookieshop_page.dart';

class SeeMoreUserCookie extends StatefulWidget {
  @override
  SeeMoreUserCookieState createState() => SeeMoreUserCookieState();
}

class SeeMoreUserCookieState extends State<SeeMoreUserCookie> {
  int _cookieCount = 0;

  // 쿠키 수를 업데이트하는 메서드
  void updateCookieCount(int newCount) {
    setState(() {
      _cookieCount = newCount;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: sizePaddingLR17, right: sizePaddingLR17),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(5),
        ),
        height: 55,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // 내 쿠키 갯수 보여주는 곳.
            MyCookie(),
            SizedBox(width: 20),
            InkWell(
              child: Text("충전하기"),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => CookieShop(),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }

  Widget MyCookie() {
    return Row(
      children: [
        Icon(Icons.cookie, color: Colors.orange),
        Text(" 내 쿠키"),
        SizedBox(width: sizeS5),
        // 여기 변수로 바꿔야함
        Text(
          "$_cookieCount개",
          style: TextStyle(color: Colors.green),
        )
      ],
    );
  }
}
