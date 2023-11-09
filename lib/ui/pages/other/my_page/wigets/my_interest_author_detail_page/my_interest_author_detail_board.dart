import 'package:flutter/material.dart';

class MyInterestAuthorDetailBoard extends StatelessWidget {
  MyInterestAuthorDetailBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(radius: 30.0),
              const SizedBox(width: 8.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "이동건",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    "2023.11.06",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            "네이버 웹툰에서 주신 선물을 1년만에 까봤는데 올해 달력이네..",
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            color: Colors.red,
            height: 300,
            child: Center(
              child: Text(
                "...",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
