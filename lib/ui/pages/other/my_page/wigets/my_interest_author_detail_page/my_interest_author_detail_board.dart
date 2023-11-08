import 'package:flutter/material.dart';

class MyInterestAuthorDetailBoard extends StatelessWidget {
  final List<String> items =
      List<String>.generate(100, (index) => "Item $index");
  MyInterestAuthorDetailBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 10, // 아이템 수
      itemBuilder: (context, index) {
        return ListTile(
          title: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Column(
              children: [
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
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Container(
                    color: Colors.red,
                    width: double.infinity,
                    height: 300,
                    child: Text("$index"),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
