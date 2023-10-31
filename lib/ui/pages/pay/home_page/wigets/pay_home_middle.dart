import 'package:flutter/material.dart';

class PayHomeMiddle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            border: Border.all(
          color: Colors.grey,
        )),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "n pay 포인트 머니",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '보유 922원',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text('포인트'),
                    Text('머니'),
                  ],
                ),
                Column(
                  children: [
                    Text("922원"),
                    Text("0원"),
                  ],
                ),
              ],
            ),
            SizedBox(height: 15),
            Row(
              children: [
                Text("사용"),
                Spacer(),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      // 테두리 색상
                      // 테두리 두께
                    ),
                  ),
                  height: 40,
                  width: 300,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("0원"),
                      Container(
                        width: 10,
                      ),
                      Container(
                        height: 30,
                        width: 2,
                        decoration: BoxDecoration(color: Colors.grey),
                      ),
                      Container(
                        width: 15,
                      ),
                      InkWell(child: Container(child: Text("전액사용"))),
                      Container(
                        width: 15,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
