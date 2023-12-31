import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/pages/pay/pay_card_page/pay_card_page.dart';

class PayMethodWhiteButton extends StatelessWidget {
  final String payment;
  final String smallFont;

  const PayMethodWhiteButton(
      {super.key, required this.payment, required this.smallFont});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => PayCardPage(), // PayCardPage로 이동
                  ),
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Text(
                    "$payment 결제",
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "$smallFont",
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                ],
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                fixedSize: MaterialStateProperty.all<Size>(
                  Size(double.infinity, 100),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
