import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/pages/webtoon/list_page/webtoon_list_view_model.dart';
import 'package:flutter_blog/ui/pages/webtoon/list_page/widgets/webtoon_list_body.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common_widgets/app_bottom.dart';

class WebtoonListPage extends ConsumerWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final refreshKey = GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      bottomNavigationBar: AppBottom(),
      body: RefreshIndicator(
        key: refreshKey,
        onRefresh: () async {
          print("리플래시됨");
          await ref.read(webtoonListProvider.notifier).notifyInit();
        },
        child: WebtoonListBody(),
      ),
    );
  }
}
