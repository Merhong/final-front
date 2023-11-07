import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/common_widgets/bottom_rule.dart';

class NoticePage extends StatefulWidget {
  @override
  _NoticePageState createState() => _NoticePageState();
}

class _NoticePageState extends State<NoticePage> {
  List<NoticeItem> notices = [
    NoticeItem("[파이널 라운드 결과]", '컨텐츠 공지', "2023-11-01"),
    NoticeItem("[오픈 안내]", '서비스공지', "2023-05-03"),
    NoticeItem("2023 지상 최대공모전 웹툰 부문 2기 상세 공지", '컨텐츠 공지', "2023-05-21"),
    NoticeItem("2023 지상 최대공모전 웹툰 부문 1기 수상작 발표", '서비스공지', "2023-07-03"),
    NoticeItem("[ㅋㅋ단편.zip]", '컨텐츠 공지', "2023-08-25"),
    NoticeItem("[안내]", '서비스공지', "2023-04-16"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true, // 뒤로 가기 버튼 표시 여부
        iconTheme: IconThemeData(
          color: Colors.black, // 뒤로 가기 버튼 아이콘 색상을 검은색으로 설정
        ),

        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          "웹툰",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '공지사항',
              style: TextStyle(
                fontSize: 20.0, // 글자 크기 설정
                fontWeight: FontWeight.bold, // 글자 두껍게 설정
              ),
            ),
          ),
          SizedBox(height: 10),
          ListView.builder(
            shrinkWrap: true,
            itemCount: notices.length,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.all(16), // 적절한 패딩을 추가하세요
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey), // 원하는 스타일을 추가하세요
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(notices[index].text,
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(notices[index].notice),
                        ],
                      ),
                    ),
                    Text(notices[index].date),
                  ],
                ),
              );
            },
          ),
          Expanded(child: BottomRule())
        ],
      ),
    );
  }
}

class NoticeItem {
  final String text;
  final String notice;
  final String date;

  NoticeItem(this.text, this.notice, this.date);
}
