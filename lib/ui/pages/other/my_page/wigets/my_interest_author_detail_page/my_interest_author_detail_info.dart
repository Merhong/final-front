import 'package:flutter/material.dart';

class MyInterestAuthorDetailInfo extends StatelessWidget {
  const MyInterestAuthorDetailInfo({super.key});

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
              SizedBox(
                width: 10,
              ),
              Text("이동건")
            ],
          ),
          SizedBox(height: 10),
          Text(
            "안녕하세요 이동건입니다!",
          )
        ],
      ),
    );
  }
}
