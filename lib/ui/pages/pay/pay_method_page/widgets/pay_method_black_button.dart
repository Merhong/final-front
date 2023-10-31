import 'package:flutter/material.dart';

class PayMethodBlackButton extends StatelessWidget {
  const PayMethodBlackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () {},
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Text(
                    "앱카드 결제",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text("현대카드 앱으로 쉽고 빠르게 결제")
                ],
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
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
