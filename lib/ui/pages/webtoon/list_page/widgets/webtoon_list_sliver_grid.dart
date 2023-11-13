import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/dto/webtoon_DTO/list_page_webtoon_DTO.dart';
import 'package:flutter_blog/data/provider/param_provider.dart';
import 'package:flutter_blog/ui/pages/webtoon/detail_page/webtoon_detail_page.dart';
import 'package:flutter_blog/ui/pages/webtoon/list_page/webtoon_list_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../common_widgets/webtoon_list_item.dart';

class WebtoonListSliverGrid extends ConsumerWidget {
  WebtoonListSliverGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    WebtoonListModel? model = ref.watch(webtoonListProvider);

    if (model == null) {
      return Center(child: CircularProgressIndicator());
    }

    List<ListPageWebtoonDTO> webtoonDTOList = model!.webtoonDTOList!;

    String week = "모두";
    if (model.weekCheck != null &&
        model.weekCheck != "신작" &&
        model.weekCheck != "완결" &&
        model.weekCheck != "매일") {
      week = model.weekCheck!;
    }

    if (week != "모두" && model.weekCheck != "신작" && model.weekCheck != "완결") {
      webtoonDTOList = webtoonDTOList
          .where((e) => e.webtoonWeekDayEnum!.contains(week))
          .toList();
    }

    if (model.weekCheck == "신작") {
      webtoonDTOList = webtoonDTOList
          .where((e) => e.webtoonSpeciallyEnum!.contains("신작"))
          .toList();
    }

    if (model.weekCheck == "완결") {
      webtoonDTOList = webtoonDTOList
          .where((e) => e.webtoonSpeciallyEnum!.contains("완결"))
          .toList();
    }

    if (model.weekCheck == "매일") {
      webtoonDTOList = webtoonDTOList
          .where((e) => e.webtoonWeekDayEnum!.contains("월화수목금토일"))
          .toList();
    }

    if (model.sortCheck == "가나다 순") {
      webtoonDTOList.sort((a, b) => a.title.compareTo(b.title));
    }

    if (model.sortCheck == "최신 순") {
      webtoonDTOList.sort((a, b) => (b.episodeUpdatedAt ?? DateTime(0))
          .compareTo(a.episodeUpdatedAt ?? DateTime(0)));
    }

    if (model.sortCheck == "인기 순") {
      // 별점 총합순
      webtoonDTOList.sort((a, b) => b.starScore!.compareTo(a.starScore!));
    }

    if (model.sortCheck == "별점 순") {
      webtoonDTOList.sort((a, b) =>
          (b.starScore! / (b.starCount == 0 ? 1 : b.starCount!))
              .compareTo(a.starScore! / (a.starCount == 0 ? 1 : a.starCount!)));
    }

    return SliverPadding(
      padding:
          EdgeInsets.fromLTRB(sizePaddingLR17, sizeS5, sizePaddingLR17, sizeS5),
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 1 / 1.75,
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => WebtoonDetailPage()));
                },
                child: WebtoonListItem(webtoonDTO: webtoonDTOList[index]));
          },
          childCount: webtoonDTOList.length,
        ),
      ),
    );
  }
}
