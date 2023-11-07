import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/pages/pay/home_page/wigets/pay_home_bottom.dart';
import 'package:flutter_blog/ui/pages/pay/home_page/wigets/pay_home_bottom_detail.dart';
import 'package:flutter_blog/ui/pages/pay/home_page/wigets/pay_home_middle.dart';
import 'package:flutter_blog/ui/pages/pay/home_page/wigets/pay_home_top.dart';
import 'package:flutter_blog/ui/pages/pay/pay_method_page/pay_method_page.dart';

class PayHomePage extends StatelessWidget {
  const PayHomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('PAY', style: TextStyle(color: Colors.black)),
            Text('결제하기', style: TextStyle(color: Colors.black)),
            IconButton(
              icon: Icon(Icons.close),
              color: Colors.black,
              onPressed: () {
                // 앱 종료 코드
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(
            sizePaddingLR17, sizeM10, sizePaddingLR17, sizeM10),
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: EdgeInsets.only(top: 8),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return Container(
                      child: PayHomeTop(),
                    );
                  },
                  childCount: 1,
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.only(top: 8),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return Container(
                      child: PayHomeMiddle(),
                    );
                  },
                  childCount: 1,
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.only(top: 8),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return Container(
                      child: PayHomeBottom(),
                    );
                  },
                  childCount: 1,
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.only(top: 8),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return Container(
                      child: PayHomeBottomDetail(),
                    );
                  },
                  childCount: 1,
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.only(top: 8),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return Column(
                      children: [
                        Text(
                          '주문 내용을 확인 하였으며, 정보 제공 등에 동의합니다.',
                          style: TextStyle(
                            fontWeight: FontWeight.bold, // 굵은 글꼴 설정
                          ),
                        ),
                        SizedBox(height: 16), // 원하는 간격 설정
                        ElevatedButton(
                          onPressed: () {
                            // 버튼 클릭 시 수행할 동작
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    PayMethodPage(), // PayMethodPage로 이동
                              ),
                            );
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.green), // 배경색
                            foregroundColor:
                                MaterialStateProperty.all(Colors.white), // 글자색
                            minimumSize: MaterialStateProperty.all(
                                Size(double.infinity, 60.0)), // 최소 너비와 높이 설정
                            padding: MaterialStateProperty.all(
                                EdgeInsets.all(12.0)), // 내부 패딩
                            textStyle: MaterialStateProperty.all(TextStyle(
                              fontSize: 18.0, // 글자 크기
                              fontWeight: FontWeight.bold, // 글자 굵기
                            )),
                          ),
                          child: Text('결제하기'), // 버튼 텍스트 설정
                        )
                      ],
                    );
                  },
                  childCount: 1,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
