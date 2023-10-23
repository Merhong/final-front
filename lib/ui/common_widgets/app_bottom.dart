import 'package:flutter/material.dart';

class AppBottom extends StatelessWidget {
  const AppBottom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: Colors.grey, width: 1.0)), // 라인효과
      ),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        // 아이템 너비 고정
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '웹툰',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: '추천완결',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.my_library_books),
            label: '베스트도전',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'My',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_vert),
            label: '더보기',
          ),
        ],
        selectedItemColor: Colors.black,
        // 선택된 아이템의 아이콘 및 라벨 텍스트 색상
        unselectedItemColor: Colors.black,
        // 선택되지 않은 아이템의 아이콘 및 라벨 텍스트 색상
        backgroundColor: Colors.white,
        selectedFontSize: 10,
        unselectedFontSize: 10,
      ),
    );
  }
}
