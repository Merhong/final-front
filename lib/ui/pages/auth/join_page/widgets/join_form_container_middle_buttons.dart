import 'package:flutter/material.dart';

class JoinFormContainerMiddleButtons extends StatefulWidget {
  @override
  _JoinFormContainerMiddleButtonsState createState() => _JoinFormContainerMiddleButtonsState();
}

class _JoinFormContainerMiddleButtonsState extends State<JoinFormContainerMiddleButtons> {
  int selectedButtonIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButton(0, "남자", Colors.white),
        _buildButton(1, "여자", Colors.white),
        _buildButton(2, "내국인", Colors.white),
        _buildButton(3, "외국인", Colors.white),
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
            color: selectedButtonIndex == index ? Colors.white : Colors.grey,
          ),
        ),
      ),
    );
  }
}
