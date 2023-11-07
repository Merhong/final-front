import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/pages/pay/home_page/pay_home_page.dart';

class PurchaseCookieBar extends StatelessWidget {
  final String cookieCount;
  final String price;

  const PurchaseCookieBar(
      {Key? key, required this.cookieCount, required this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(13.0),
        child: Row(
          children: [
            Icon(
              Icons.cookie,
              color: Colors.orange,
            ),
            SizedBox(
              width: 5.0, // 고정 값 사용
            ),
            Text("쿠키 $cookieCount"), // 매개변수를 사용하여 쿠키 개수를 설정
            SizedBox(
              width: 5.0, // 고정 값 사용
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                // 버튼 클릭 시 수행할 동작
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => PayHomePage(
                        cookieCount: cookieCount,
                        price: price), // PayMethodPage로 이동
                  ),
                );
              },
              child: Text(
                '\$$price', // 매개변수를 사용하여 가격을 설정
                style: TextStyle(
                  color: Colors.white, // 글자색을 하얀색으로 설정
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green), // 배경색
                padding: MaterialStateProperty.all(EdgeInsets.all(12.0)),
                minimumSize:
                    MaterialStateProperty.all(Size(80, 36)), // 최소 너비 설정// 내부 패딩
              ),
            ),
          ],
        ),
      ),
    );
  }
}
