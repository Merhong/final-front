import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/pages/webtoon/list_page/webtoon_list_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../common_widgets/my_sliver_persistent_header_delegate.dart';

class WebtoonListSliverPersistentHeader extends ConsumerWidget {
  const WebtoonListSliverPersistentHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverPersistentHeader(
      pinned: true,
      floating: false,
      delegate: MySliverPersistentHeaderDelegate(
        minHeight: 45.0,
        maxHeight: 45.0,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.symmetric(horizontal: BorderSide(color: Colors.grey, width: 1.0)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // WebtoonListWeekSelect(checkWeek: "모두"), TODO 기본 화면이 모두 보는건데 버튼도 만들지 안만들지
              WebtoonListWeekSelect(checkWeek: "신작"),
              WebtoonListWeekSelect(checkWeek: "매일"),
              WebtoonListWeekSelect(checkWeek: "월"),
              WebtoonListWeekSelect(checkWeek: "화"),
              WebtoonListWeekSelect(checkWeek: "수"),
              WebtoonListWeekSelect(checkWeek: "목"),
              WebtoonListWeekSelect(checkWeek: "금"),
              WebtoonListWeekSelect(checkWeek: "토"),
              WebtoonListWeekSelect(checkWeek: "일"),
              WebtoonListWeekSelect(checkWeek: "완결"),
            ],
          ),
        ),
      ),
    );
  }
}

class WebtoonListWeekSelect extends ConsumerWidget {
  const WebtoonListWeekSelect({
    required this.checkWeek,
  });

  final String? checkWeek;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String? weekClickCheck = ref.read(webtoonListProvider)!.weekCheck;
    // print(weekClickCheck);

    return Container(
      child: weekClickCheck == "${checkWeek}"
          ? InkWell(
              // onTap: () => ref.read(webtoonListProvider.notifier).notifyWeek("신작"),
              child: Text("${checkWeek}", style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
            )
          : InkWell(
              onTap: () => ref.read(webtoonListProvider.notifier).notifyWeek("${checkWeek}"),
              child: Text("${checkWeek}", style: TextStyle(color: Colors.black)),
            ),
    );
  }
}
