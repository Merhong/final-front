import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/pages/pay/pay_card_page/widgets/pay_card_button.dart';
import 'package:flutter_blog/ui/pages/pay/pay_card_page/widgets/pay_card_form.dart';

class PayCardPage extends StatelessWidget {
  const PayCardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            // 뒤로 가기 동작을 추가할 수 있습니다.
          },
        ),
        title: Text(
          "일반결제",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.close),
            color: Colors.black,
          )
        ],
      ),
      body: Column(
        children: [
          PayCardForm(),
          PayCardButton(),
        ],
      ),
    );
  }
}
