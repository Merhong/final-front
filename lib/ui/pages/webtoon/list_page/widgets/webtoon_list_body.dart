import 'package:flutter/material.dart';
import 'package:flutter_blog/data/dto/webtoon_DTO/list_page_webtoon_DTO.dart';
import 'package:flutter_blog/data/model/webtoon.dart';
import 'package:flutter_blog/data/provider/session_provider.dart';
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

    List<ListPageWebtoonDTO> webtoonDTOList = model!.webtoonDTOList!;

    return CustomScrollView(
      slivers: <Widget>[
        WebtoonListSliverAppBarAndPageView(),
        WebtoonListSliverPersistentHeader(),
        WebtoonListMiddleAdvertising(),
        WebtoonListSliverGrid(webtoonDTOList: webtoonDTOList),
      ],
    );
  }
}
