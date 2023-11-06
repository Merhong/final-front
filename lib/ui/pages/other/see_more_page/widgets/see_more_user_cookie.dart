import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/size.dart';

class SeeMoreUserCookie extends StatelessWidget {
  const SeeMoreUserCookie({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: sizePaddingLR17, right: sizePaddingLR17),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey[300], borderRadius: BorderRadius.circular(5)),
        height: 55,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            //내 쿠키 갯수 보여주는 곳.
            MyCookie(),
            SizedBox(width: 20),
            InkWell(
              child: Text("충전하기"),
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
        //여기 변수로 바꿔야함
        Text(
          "3개",
          style: TextStyle(color: Colors.green),
        )
      ],
    );
  }
}
