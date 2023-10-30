import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/dto/webtoon_DTO/detail_page_webtoon_DTO.dart';
import 'package:flutter_blog/data/provider/param_provider.dart';
import 'package:flutter_blog/ui/pages/webtoon/detail_page/webtoon_detail_view_model.dart';
import 'package:flutter_blog/ui/pages/webtoon/detail_page/widgets/webtoon_detail_appbar.dart';
import 'package:flutter_blog/ui/pages/webtoon/detail_page/widgets/webtoon_detail_body.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common_widgets/app_bottom.dart';

class WebtoonDetailPage extends ConsumerStatefulWidget {
  WebtoonDetailPage({Key? key}) : super(key: key);

  @override
  _WebtoonDetailPageState createState() => _WebtoonDetailPageState();
}

class _WebtoonDetailPageState extends ConsumerState<WebtoonDetailPage> {
  // final scaffoldKey = GlobalKey<ScaffoldState>();
  final refreshKey = GlobalKey<RefreshIndicatorState>();

  final ScrollController detailPageController = ScrollController();

  bool isScroll = false;

  @override
  void initState() {
    detailPageController.addListener(() {
      // print("offset : ${detailPageController.offset}");
      if (detailPageController.offset >= 20 && isScroll == false) {
        print("스크롤 감지");
        isScroll = true;
        setState(() {});
      } else if (detailPageController.offset < 20 && isScroll == true) {
        print("스크롤 처음");
        isScroll = false;
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (ref.read(paramProvider).isWebtoonDetailMove == true) {
      print("ref.read(paramProvider).isWebtoonDetailMove : ${ref.read(paramProvider).isWebtoonDetailMove}");
      ref.read(paramProvider).isWebtoonDetailMove = false;
      ref.read(webtoonDetailProvider.notifier).notifyInit();
    }

    WebtoonDetailModel? model = ref.watch(webtoonDetailProvider);
    if (model == null) {
      ref.read(webtoonDetailProvider.notifier).notifyInit();
      return Center(child: CircularProgressIndicator());
    }
    DetailPageWebtoonDTO webtoonDTO = model.webtoonDTO!;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: WebtoonDetailAppbar(isScroll, webtoonDTO),
      bottomNavigationBar: AppBottom(),
      body: RefreshIndicator(
        key: refreshKey,
        onRefresh: () async => await ref.read(webtoonDetailProvider.notifier).notifyInit(),
        child: WebtoonDetailBody(detailPageController, isScroll, webtoonDTO),
      ),
    );
  }
}
