import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/pages/other/author_page/my_interest_author_detail_view_model.dart';
import 'package:flutter_blog/ui/pages/other/author_page/widgets/my_interest_author_detail_appbar.dart';
import 'package:flutter_blog/ui/pages/other/author_page/widgets/my_interest_author_detail_body.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyInterestAuthorDetailPage extends ConsumerWidget {
  const MyInterestAuthorDetailPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final refreshKey = GlobalKey<RefreshIndicatorState>();

    return RefreshIndicator(
      key: refreshKey,
      onRefresh: () async {
        print("리플래시됨");
        await ref.read(myAuthorDetailPageProvider.notifier).notifyInit();
      },
      child: Scaffold(
        appBar: MyInterestAuthorDetailAppBar(),
        body: MyInterestAuthorDetailBody(),
      ),
    );
  }
}
