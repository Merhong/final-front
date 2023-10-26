import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/pages/webtoon/list_page/week_view_model.dart';
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
            border: Border.symmetric(
                horizontal: BorderSide(color: Colors.grey, width: 1.0)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Text("모두", style: TextStyle(color: Colors.black)), //TODO
              Text("신작", style: TextStyle(color: Colors.black)), //TODO
              Text("매일+", style: TextStyle(color: Colors.black)), //TODO
              InkWell(
                // onTap: () => ref.read(weekProvider)!.week = "월", // 이거는 왜 안되는건지
                onTap: () => ref.read(weekProvider.notifier).notifyWeek("월"),
                child: Text(" 월 ", style: TextStyle(color: Colors.black)),
              ),
              InkWell(
                onTap: () => ref.read(weekProvider.notifier).notifyWeek("화"),
                child: Text(" 화 ", style: TextStyle(color: Colors.black)),
              ),
              InkWell(
                onTap: () => ref.read(weekProvider.notifier).notifyWeek("수"),
                child: Text(" 수 ", style: TextStyle(color: Colors.black)),
              ),
              InkWell(
                onTap: () => ref.read(weekProvider.notifier).notifyWeek("목"),
                child: Text(" 목 ", style: TextStyle(color: Colors.black)),
              ),
              InkWell(
                onTap: () => ref.read(weekProvider.notifier).notifyWeek("금"),
                child: Text(" 금 ", style: TextStyle(color: Colors.black)),
              ),
              InkWell(
                onTap: () => ref.read(weekProvider.notifier).notifyWeek("토"),
                child: Text(" 토 ", style: TextStyle(color: Colors.black)),
              ),
              InkWell(
                onTap: () => ref.read(weekProvider.notifier).notifyWeek("일"),
                child: Text(" 일 ", style: TextStyle(color: Colors.black)),
              ),
              Text("완결", style: TextStyle(color: Colors.black)), //TODO
            ],
          ),
        ),
      ),
    );
  }
}
