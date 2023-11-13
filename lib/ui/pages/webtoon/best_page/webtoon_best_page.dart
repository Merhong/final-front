import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/provider/param_provider.dart';
import 'package:flutter_blog/ui/common_widgets/app_bottom.dart';
import 'package:flutter_blog/ui/pages/webtoon/best_page/widgets/best_nested_tab_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BestPage extends ConsumerWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return WillPopScope(
      onWillPop: () {
        ParamStore ps = ref.read(paramProvider);
        onItemTapped(0, context, ps);
        // ps.addBottomNavigationBarIndex(0);
        return Future.value(false);
      },
      child: DefaultTabController(
        initialIndex: 1,
        length: 7,
        child: Scaffold(
          appBar: AppBar(
            elevation: 1,
            backgroundColor: Colors.white,
            title: Text(
              '베스트도전',
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold // 또는 Colors.black으로 변경
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
                Tab(
                  child: Text(
                    "전체",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    "순정",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    "액션",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    "스포츠",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    "스릴러",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    "판타지",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    "드라마",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
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
      ),
    );
  }
}
