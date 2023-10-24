import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/dto/webtoon_DTO/list_page_webtoon_DTO.dart';
import 'package:flutter_blog/data/provider/param_provider.dart';
import 'package:flutter_blog/ui/pages/webtoon/detail_page/webtoon_detail_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../data/model/webtoon.dart';
import '../../../../common_widgets/webtoon_list_item.dart';

class WebtoonListSliverGrid extends ConsumerWidget {
  const WebtoonListSliverGrid({
    super.key,
    required this.webtoonDTOList,
  });

  final List<ListPageWebtoonDTO> webtoonDTOList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: sizePaddingLR17),
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 1 / 1.7,
          crossAxisSpacing: sizeS5,
          mainAxisSpacing: sizeS5,
          crossAxisCount: 3,
        ),
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return InkWell(
                onTap: () {
                  ParamStore paramStore = ref.read(paramProvider);
                  paramStore.addWebtoonDetailId(webtoonDTOList[index].id);
                  Navigator.push(context, MaterialPageRoute(builder: (_) => WebtoonDetailPage()));
                  // print("실행됨");
                },
                child: WebtoonListItem(webtoonDTO: webtoonDTOList[index]));
          },
          childCount: webtoonDTOList.length,
        ),
      ),
    );
  }
}
