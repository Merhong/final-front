import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/pages/pay/home_page/wigets/button.dart';

class PayHomeBottom extends StatefulWidget {
  const PayHomeBottom({
    Key? key,
  }) : super(key: key);

  @override
  _PayHomeBottomState createState() => _PayHomeBottomState();
}

class _PayHomeBottomState extends State<PayHomeBottom> {
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
                    '결제수단',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Text(
                    '1.000원',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          '일반결제',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Button(),
                    Row(
                      children: [
                        Icon(Icons.info, size: 24, color: Colors.grey),
                        Text(
                          '결제/할인혜택 안내',
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                        ),
                        Spacer(),
                        Text(
                          '전체보기>',
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.blue,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Text(
                      '등록된 계좌/카드는 설정>계좌/카드 정보에서 확인 가능합니다.',
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
//나는 화면하고 이써떠 통신은 이제 해야하는데 하야니 언니가 바뺘
//통신 혼자 해볼게
