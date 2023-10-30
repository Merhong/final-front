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
    return Padding(
      padding: const EdgeInsets.only(top: 2),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '결제상품',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
            if (isProductInfoVisible)
              Row(
                children: [
                  Icon(Icons.info, size: 24), // 아이콘을 눌러 상품 정보 보기
                  SizedBox(width: 4),
                  Text(
                    '쿠키 10개',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    '1.000원',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            Row(
              children: [
                Text(
                  '상품금액',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Text(
                  '1,000원',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
