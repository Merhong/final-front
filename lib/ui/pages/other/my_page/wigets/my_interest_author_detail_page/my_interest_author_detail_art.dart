import 'package:flutter/material.dart';

class MyInterestAuthorDetailArt extends StatelessWidget {
  const MyInterestAuthorDetailArt({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        height: 200,
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
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(color: Colors.green),
                    height: 100,
                    width: 230,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(color: Colors.green),
                    height: 100,
                    width: 230,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(color: Colors.green),
                    height: 100,
                    width: 230,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  // ListView.builder(
                  //   itemCount: items.length,
                  //   itemBuilder: (context, index) {
                  //     // index를 사용하여 해당 인덱스에 해당하는 아이템을 렌더링
                  //     return ListTile(
                  //       title: Text(items[index]),
                  //     );
                  //   },
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}