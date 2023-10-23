import 'package:flutter/material.dart';
import 'package:flutter_blog/data/model/webtoon.dart';
import 'package:flutter_blog/ui/pages/webtoon/list_page/webtoon_list_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'webtoon_list_middle_advertising.dart';
import 'webtoon_list_sliver_appbar_and_pageview.dart';
import 'webtoon_list_sliver_grid.dart';
import 'webtoon_list_sliver_persistent_header.dart';

class WebtoonListBody extends ConsumerWidget {
  const WebtoonListBody({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    WebtoonListModel? model = ref.watch(webtoonListProvider);

    if (model == null) {
      return Center(child: CircularProgressIndicator());
    }

    List<Webtoon> webtoonList = model!.webtoonList!;

    return CustomScrollView(
      slivers: <Widget>[
        WebtoonListSliverAppBarAndPageView(),
        WebtoonListSliverPersistentHeader(),
        WebtoonListMiddleAdvertising(),
        WebtoonListSliverGrid(webtoonList: webtoonList),
      ],
    );
  }
}
