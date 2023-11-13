import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/my_color.dart';

class WebttonListBottomReview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    '네이버웹툰 (유) 사업자 정보',
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Divider(
              color: CommonColors.grey,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    '모든 콘텐츠의 저작권은 저작권자 또는 제공처에 있으며, 이를 무단으로 이용하는 경우 관련 법령에 따라 법적 책임을 질 수 있습니다.',
                  ),
                ),
              ],
            ),
            Divider(
              color: CommonColors.grey,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(7.0),
                    child: Text(
                      '네이버웹툰 이용약관',
                      style: TextStyle(
                        fontSize: 12.0, // 원하는 글자 크기 설정
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      '전용상품권 이용약관',
                      style: TextStyle(
                        fontSize: 12.0,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      '개인정보처리방침',
                      style: TextStyle(
                        fontSize: 12.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Center(
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 120),
                    child: Expanded(
                      child: Text(
                        '고객센터',
                        style: TextStyle(
                          fontSize: 12.0,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 50),
                    child: Expanded(
                      child: Text(
                        '오류신고',
                        style: TextStyle(
                          fontSize: 12.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 90),
                    child: Text(
                      'Ö NAVER WEBTOON Limited',
                      style: TextStyle(
                        fontSize: 15.0, // 원하는 글자 크기 설정
                      ),
                    ),
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
