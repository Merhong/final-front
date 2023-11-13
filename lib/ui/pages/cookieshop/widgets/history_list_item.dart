import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/my_color.dart';
import 'package:flutter_blog/_core/constants/size.dart';

class historyList extends StatelessWidget {
  final String purchase;
  int? amount;

  historyList({super.key, required this.purchase, this.amount});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Row(
        children: [
          Text(
            purchase,
            style: TextStyle(color: CommonColors.grey),
          ),
          SizedBox(
            width: sizeS5,
          ),
          Text("$amount")
        ],
      ),
    );
  }
}
