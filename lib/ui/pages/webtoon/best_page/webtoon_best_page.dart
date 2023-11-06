import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/common_widgets/app_bottom.dart';
import 'package:flutter_blog/ui/pages/webtoon/best_page/widgets/best_nested_tab_bar.dart';

class BestPage extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 7,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            '베스트도전',
            style: TextStyle(
              fontSize: sizeL20,
              color: Colors.black, // 또는 Colors.black으로 변경
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: sizePaddingLR17),
              child: Icon(
                Icons.search,
                color: Colors.black,
              ),
            )
          ],
          bottom: TabBar(
            isScrollable: true,
            labelPadding: EdgeInsets.symmetric(horizontal: 15.0),
            indicatorColor: Colors.green, // 탭 바 아래의 인디케이터 색상
            labelColor: Colors.green, // 선택된 탭의 텍스트 색상
            unselectedLabelColor: Colors.black, // 선택되지 않은 탭의 텍스트 색상
            tabs: <Widget>[
              Tab(text: '전체'),
              Tab(text: '순정'),
              Tab(text: '액션'),
              Tab(text: '스포츠'),
              Tab(text: '스릴러'),
              Tab(text: '판타지'),
              Tab(text: '드라마'),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            BestNestedTabBar('전체'),
            BestNestedTabBar('순정'),
            BestNestedTabBar('액션'),
            BestNestedTabBar('스포츠'),
            BestNestedTabBar('스릴러'),
            BestNestedTabBar('판타지'),
            BestNestedTabBar('드라마'),
          ],
        ),
        bottomNavigationBar: AppBottom(),
      ),
    );
  }
}
