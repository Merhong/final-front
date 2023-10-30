import 'package:flutter/material.dart';
import 'package:flutter_blog/data/dto/user_dto/interest_webtoon_DTO.dart';
import 'package:flutter_blog/ui/pages/other/my_page/my_page_view_model.dart';
import 'package:flutter_blog/ui/pages/other/my_page/wigets/my_tab_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyBodyTabBar extends ConsumerStatefulWidget {
  @override
  _MyBodyTabBarState createState() => _MyBodyTabBarState();
}

class _MyBodyTabBarState extends ConsumerState<MyBodyTabBar> with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    MyPageModel? model = ref.watch(myPageProvider);

    if (model == null) {
      return Center(child: CircularProgressIndicator());
    }

    List<InterestWebtoonDTO> interestWebtoonDTOList = model.interestWebtoonDTOList!;

    return MyTabBar(tabController: _tabController);
  }
}
