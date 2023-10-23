import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/pages/webtoon/detail_page/webtoon_detail_view_model.dart';
import 'package:flutter_blog/ui/pages/webtoon/detail_page/widgets/webtoon_detail_body.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

import '../../../common_widgets/app_bottom.dart';

class WebtoonDetailPage extends ConsumerWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final refreshKey = GlobalKey<RefreshIndicatorState>();

  WebtoonDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      // appBar: AppBar(backgroundColor: Colors.blue[900]),
      bottomNavigationBar: AppBottom(),
      body: RefreshIndicator(
        key: refreshKey,
        onRefresh: () async {
          print("리플래시됨");
          await ref.read(webtoonDetailProvider.notifier).notifyInit();
        },
        child: WebtoonDetailBody(),
      ),
    );
  }
}
