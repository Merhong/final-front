import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/pages/pay/home_page/wigets/card_button.dart';

class Button extends StatefulWidget {
  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  int selectedButtonIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildButton(0, "신용카드", Colors.white),
            _buildButton(1, "휴대폰", Colors.white),
            _buildButton(2, "상품권", Colors.white),
            _buildButton(3, "문화누리", Colors.white),
          ],
        ),
        if (selectedButtonIndex != -1)
          Container(
            color: Colors.white, // 카드 배경색
            padding: EdgeInsets.all(3.0),
            child: CardButton('카드선택'),
          ),
      ],
    );
  }

  Widget _buildButton(int index, String label, Color backgroundColor) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedButtonIndex = index;
        });
      },
      child: Container(
        color: selectedButtonIndex == index ? Colors.green : backgroundColor,
        padding: EdgeInsets.all(16.0),
        child: Text(
          label,
          style: TextStyle(
            color: selectedButtonIndex == index ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
