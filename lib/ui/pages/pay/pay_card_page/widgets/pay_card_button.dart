import 'package:flutter/material.dart';

class PayCardButton extends StatelessWidget {
  const PayCardButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
                child: Text('다음'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.grey, // 버튼의 배경색
                  onPrimary: Colors.white, // 버튼 텍스트의 색상
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
