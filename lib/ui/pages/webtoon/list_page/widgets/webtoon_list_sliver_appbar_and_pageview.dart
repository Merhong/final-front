import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/pages/webtoon/list_page/webtoon_list_view_model.dart';
import 'package:flutter_blog/ui/pages/webtoon/list_page/widgets/webtoon_list_appbar_dropdown.dart';
import 'package:flutter_blog/ui/pages/webtoon/list_page/widgets/webtoon_list_pageview.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../common_widgets/search_alert_dialog.dart';

class WebtoonListSliverAppBarAndPageView extends StatelessWidget {
  bool isScroll;

  WebtoonListSliverAppBarAndPageView(this.isScroll);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      centerTitle: true,
      // primary: false, // 상단 화면표시줄 침범함
      title: Container(width: 110, child: isScroll ? WebtoonListAppbarDropdown() : SizedBox()),
      backgroundColor: Colors.white,
      elevation: 0,
      leading: InkWell(
        onTap: () {},
        child: Icon(Icons.cookie, size: 30, color: Colors.orange),
      ),
      actions: [
        InkWell(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return SearchAlertDialog();
              },
            );
          },
          child: Icon(Icons.search, size: 30, color: Colors.black),
        ),
        SizedBox(width: 18),
      ],
      pinned: true,
      expandedHeight: 200,
      flexibleSpace: FlexibleSpaceBar(
        background: InkWell(
          onTap: () {
            print("페이지뷰클릭");
          },
          child: WebtoonListPageView(),
        ),
      ),
    );
  }
}
