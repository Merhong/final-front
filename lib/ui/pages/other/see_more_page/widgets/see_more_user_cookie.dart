import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/my_color.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/provider/session_provider.dart';
import 'package:flutter_blog/ui/pages/cookieshop/cookieshop_page.dart';
import 'package:flutter_blog/ui/pages/pay/home_page/wigets/payment_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SeeMoreUserCookie extends ConsumerStatefulWidget {
  @override
  SeeMoreUserCookieState createState() => SeeMoreUserCookieState();
}

class SeeMoreUserCookieState extends ConsumerState<SeeMoreUserCookie> {
  int _cookieCount = 0;

  // 쿠키 수를 업데이트하는 메서드
  void updateCookieCount(int newCount) {
    setState(() {
      _cookieCount = newCount;
    });
  }

  @override
  Widget build(BuildContext context) {
    SessionUser user = ref.read(sessionProvider);
    ref.watch(paymentProvider);
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
            MyCookie(user.user!.cookie),
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

  Widget MyCookie(int? cookieAmount) {
    return Row(
      children: [
        Icon(Icons.cookie, color: Colors.orange),
        Text(" 내 쿠키"),
        SizedBox(width: sizeS5),
        // 여기 변수로 바꿔야함
        Text(
          "${cookieAmount}개",
          style: TextStyle(color: CommonColors.green),
        )
      ],
    );
  }
}
