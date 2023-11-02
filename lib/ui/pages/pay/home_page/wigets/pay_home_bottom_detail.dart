import 'package:flutter/material.dart';

class PayHomeBottomDetail extends StatefulWidget {
  const PayHomeBottomDetail({
    Key? key,
  }) : super(key: key);

  @override
  _PayHomeBottomDetailState createState() => _PayHomeBottomDetailState();
}

class _PayHomeBottomDetailState extends State<PayHomeBottomDetail> {
  bool isProductInfoVisible = false;

  void toggleProductInfo() {
    setState(() {
      isProductInfoVisible = !isProductInfoVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(border: Border.all(color: Colors.grey, width: 1.0)),
      child: Column(
        children: [
          Container(
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '결제상세',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                GestureDetector(
                  onTap: toggleProductInfo,
                  child: Icon(
                    isProductInfoVisible
                        ? Icons.arrow_drop_up
                        : Icons.arrow_drop_down,
                    size: 24,
                  ),
                ),
              ],
            ),
          ),
          Divider(
            height: 15,
            color: Colors.black,
          ),
          if (isProductInfoVisible)
            Container(
              height: 40,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    SizedBox(width: 4),
                    Text(
                      '주문금액',
                      style: TextStyle(fontSize: 18),
                    ),
                    Spacer(),
                    Text(
                      '1.000원',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
          Container(
            height: 50,
            decoration: BoxDecoration(color: Colors.lightBlue[50]),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    '신용카드',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Text(
                    '1,000원',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
//나는 화면하고 이써떠 통신은 이제 해야하는데 하야니 언니가 바뺘
//통신 혼자 해볼게
