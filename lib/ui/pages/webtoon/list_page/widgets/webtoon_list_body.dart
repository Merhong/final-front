import 'package:flutter/material.dart';
import 'package:flutter_blog/data/dto/webtoon_DTO/list_page_webtoon_DTO.dart';
import 'package:flutter_blog/ui/common_widgets/bottom_rule.dart';
import 'package:flutter_blog/ui/pages/webtoon/list_page/webtoon_list_view_model.dart';
import 'package:flutter_blog/ui/pages/webtoon/list_page/widgets/webtoon_list_bottom_random.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'webtoon_list_sliver_appbar_and_pageview.dart';
import 'webtoon_list_sliver_grid.dart';
import 'webtoon_list_sliver_persistent_header.dart';

class WebtoonListBody extends ConsumerWidget {
  final ScrollController listPageController;
  bool isScroll;

  WebtoonListBody(this.listPageController, this.isScroll);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    WebtoonListModel? model = ref.watch(webtoonListProvider);

    if (model == null) {
      return Center(child: CircularProgressIndicator());
    }

    List<ListPageWebtoonDTO> webtoonDTOList = model!.webtoonDTOList!;

    return CustomScrollView(
      controller: listPageController,
      slivers: <Widget>[
        WebtoonListSliverAppBarAndPageView(isScroll),
        WebtoonListSliverPersistentHeader(),

        WebtoonListSliverGrid(),
        // SliverToBoxAdapter(
        //   child: Container(
        //     height: 200.0,
        //     child: WebtoonListBottomView(),
        //   ),
        // ),
        WebtoonListBottomRandom(),
        SliverToBoxAdapter(child: BottomRule()),

        // SliverToBoxAdapter(
        //   child: Container(
        //     height: 200.0, // 높이 설정
        //     child: WebtoonListBottomView(),
        //   ),
        // ),
        // WebtoonListBottomRandom(),
        // WebttonListBottomReview(),
      ],
    );
  }
}
