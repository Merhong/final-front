import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: searchController,
              decoration: InputDecoration(
                labelText: '검색어를 입력하세요',
                suffixIcon: Icon(Icons.search),
              ),
              onSubmitted: (value) {
                // 사용자가 검색어를 입력하고 Enter 키를 누르면 실행되는 콜백
                performSearch(value);
              },
            ),
            // 다른 위젯을 추가하려면 여기에 추가
          ],
        ),
      ),
    );
  }

  void performSearch(String query) {
    // 검색 기능을 구현하고 검색 결과 화면으로 이동하는 로직을 추가
    // 이 예제에서는 검색어를 콘솔에 출력하는 것으로 대체
    print('검색어: $query');
  }
}
