import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/pages/pay/pay_method_page/widgets/pay_method_black_button.dart';
import 'package:flutter_blog/ui/pages/pay/pay_method_page/widgets/pay_method_white_button.dart';

class PayMethodPage extends StatelessWidget {
  const PayMethodPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text(
            "Hyundai Card",
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            TextButton(
              onPressed: () {},
              child: Text(
                "간편결제",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ),
            Container(
              width: 1,
              height: 5,
              color: Colors.grey,
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                "페이결제",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            SizedBox(height: 8),
            PayMethodBlackButton(),
            SizedBox(height: 5),
            PayMethodWhiteButton(
              payment: "PIN번호",
              smallFont: "6자리 숫자로 간편하게 (PayShot 포함)",
            ),
            SizedBox(height: 5),
            PayMethodWhiteButton(
              payment: "일반",
              smallFont: "카드번호로 결제 (기존 등록 카드만 가능)",
            ),
          ],
        ),
      ),
    );
  }
}
