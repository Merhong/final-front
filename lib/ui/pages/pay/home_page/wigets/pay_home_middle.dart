import 'package:flutter/material.dart';

class PayHomeMiddle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
          color: Colors.grey,
        )),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "n pay 포인트 머니",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '보유 922원',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text('포인트',
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold)),
                      Text('머니',
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Column(
                    children: [
                      Text('922원',
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold)),
                      Text('머니',
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 15),
              Container(
                height: 60,
                child: Row(
                  children: [
                    Text('사용', style: TextStyle(fontWeight: FontWeight.bold)),
                    Spacer(),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          // 테두리 색상
                          // 테두리 두께
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      height: 40,
                      width: 300,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text("0원"),
                          Container(
                            height: 30,
                            width: 2,
                            decoration: BoxDecoration(color: Colors.grey),
                          ),
                          Container(
                            width: 15,
                          ),
                          InkWell(
                              child: Container(
                            child: Text('전액사용',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          )),
                          Container(
                            width: 15,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
