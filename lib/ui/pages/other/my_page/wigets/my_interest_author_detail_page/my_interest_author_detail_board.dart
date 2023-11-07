import 'package:flutter/material.dart';

class MyInterestAuthorDetailBoard extends StatelessWidget {
  const MyInterestAuthorDetailBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(
            "게시글",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              CircleAvatar(radius: 30.0),
              SizedBox(
                width: 3,
              ),
              Column(
                children: [
                  Text("이동건"),
                  Text("2023.11.06"),
                ],
              ),
            ],
          ),
          Text("네이버웹툰에서 주신 선물을 1년만에 까봤는데 올해 달력이네.."),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 300,
            width: double.infinity,
            decoration: BoxDecoration(color: Colors.green),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.face),
              ),
              SizedBox(
                width: 30,
              ),
              Icon(Icons.face_2),
              Icon(Icons.face_2),
              Icon(Icons.face_2),
              Text("245"),
            ],
          ),
        ],
      ),
    );
  }
}
