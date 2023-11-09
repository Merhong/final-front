import 'package:flutter/material.dart';

class MyInterestAuthorDetailArt extends StatelessWidget {
  const MyInterestAuthorDetailArt({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "이동건 작가의 작품",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.left,
          ),
          SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 3, // You can adjust the number of items
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: Container(
                    decoration: BoxDecoration(color: Colors.green),
                    height: 100,
                    width: 230,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
