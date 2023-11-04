import 'package:flutter/material.dart';

class PayHomeTop extends StatefulWidget {
  const PayHomeTop({
    Key? key,
  }) : super(key: key);

  @override
  _PayHomeTopState createState() => _PayHomeTopState();
}

class _PayHomeTopState extends State<PayHomeTop> {
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
                    '결제상품',
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
              height: 100,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      "assets/pay.png",
                      fit: BoxFit.cover,
                    ),
                    Row(
                      children: [
                        Text(
                          '쿠키 10개',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          '1.000원',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
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
                    '상품금액',
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
