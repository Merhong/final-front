import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/pages/pay/home_page/wigets/pay_home_bottom.dart';
import 'package:flutter_blog/ui/pages/pay/home_page/wigets/pay_home_bottom_detail.dart';
import 'package:flutter_blog/ui/pages/pay/home_page/wigets/pay_home_middle.dart';
import 'package:flutter_blog/ui/pages/pay/home_page/wigets/pay_home_top.dart';

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
          ],
        ),
      ),
    );
  }
}
