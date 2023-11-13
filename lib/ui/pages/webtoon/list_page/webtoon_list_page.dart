import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/move.dart';
import 'package:flutter_blog/data/provider/advertising_sub_provider.dart';
import 'package:flutter_blog/data/provider/param_provider.dart';
import 'package:flutter_blog/data/provider/push_move_view_model.dart';
import 'package:flutter_blog/data/provider/session_provider.dart';
import 'package:flutter_blog/main.dart';
import 'package:flutter_blog/ui/common_widgets/my_stackbar.dart';
import 'package:flutter_blog/ui/pages/webtoon/detail_page/webtoon_detail_page.dart';
import 'package:flutter_blog/ui/pages/webtoon/list_page/webtoon_list_view_model.dart';
import 'package:flutter_blog/ui/pages/webtoon/list_page/widgets/webtoon_list_body.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common_widgets/app_bottom.dart';

class WebtoonListPage extends ConsumerStatefulWidget {
  @override
  _WebtoonListPageState createState() => _WebtoonListPageState();
}

class _WebtoonListPageState extends ConsumerState<WebtoonListPage> {
  // final scaffoldKey = GlobalKey<ScaffoldState>();
  final refreshKey = GlobalKey<RefreshIndicatorState>();

  final ScrollController listPageController = ScrollController();
  bool isScroll = false;

  @override
  void initState() {
    listPageController.addListener(() {
      // print("offset : ${detailPageController.offset}");
      if (listPageController.offset >= 130 && isScroll == false) {
        print("스크롤 감지");
        isScroll = true;
        setState(() {});
      } else if (listPageController.offset < 130 && isScroll == true) {
        print("스크롤 처음");
        isScroll = false;
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      var a = ref.watch(pushMoveProvider);

      print("a!.whereMoveId ${a!.whereMoveId}");

      if (a != null && a.whereMoveId != -1) {
        print(a!.whereMoveId);
        print("가가 if로");
        ParamStore paramStore = ref.read(paramProvider);
        paramStore.addWebtoonDetailId(a.whereMoveId);

        a.whereMoveId = -1;
        // ref.read(pushMoveProvider.notifier).notifyWhereMove(messageWebtoonId);

        Navigator.popUntil(context, ModalRoute.withName(Move.homeListPage)); // 홈페이지 말고 다른페이지 삭제
        Navigator.push(context, MaterialPageRoute(builder: (_) => WebtoonDetailPage()));
      }

      if (ref.read(paramProvider).isLoginMove == true) {
        ref.read(paramProvider).isLoginMove = false;
        mySnackbar(
          context,
          2000,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("${ref.read(sessionProvider).user!.username}(${ref.read(sessionProvider).user!.email.split("@")[0]}) 자동 로그인"),
            ],
          ),
        );
      }

      ref.read(advertisingSubProvider).fetchAdvertisingSubList(ref.read(sessionProvider).jwt!);
    });

    // var a = ref.watch(myAuthorPageProvider);
    //
    // if (a != null && a.sortCheck == "가가") {
    //   print("가가 if로");
    //   ParamStore paramStore = ref.read(paramProvider);
    //   paramStore.addWebtoonDetailId(101);
    //   Navigator.push(context, MaterialPageRoute(builder: (_) => WebtoonDetailPage()));
    // }
    //
    // if (ref.read(paramProvider).isLoginMove == true) {
    //   ref.read(paramProvider).isLoginMove = false;
    //   WidgetsBinding.instance.addPostFrameCallback((_) {
    //     // 여기에서 showSnackBar() 호출
    //     mySnackbar(
    //       context,
    //       2000,
    //       Row(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: [
    //           Text("${ref.read(sessionProvider).user!.username}(${ref.read(sessionProvider).user!.email.split("@")[0]}) 자동 로그인"),
    //         ],
    //       ),
    //     );
    //
    //     //
    //   });
    // }
    //
    // ref.read(advertisingSubProvider).fetchAdvertisingSubList(ref.read(sessionProvider).jwt!);

    return Scaffold(
      bottomNavigationBar: AppBottom(),
      body: WillPopScope(
        onWillPop: onWillPop,
        child: RefreshIndicator(
          key: refreshKey,
          onRefresh: () async {
            print("리플래시됨");
            await ref.read(webtoonListProvider.notifier).notifyInit();
          },
          child: WebtoonListBody(listPageController, isScroll),
        ),
      ),
    );
  }

  DateTime? currentBackPressTime;

  Future<bool> onWillPop() {
    final mContext = navigatorKey.currentContext;
    DateTime now = DateTime.now();

    if (currentBackPressTime == null || now.difference(currentBackPressTime!) > Duration(seconds: 2)) {
      currentBackPressTime = now;

      mySnackbar(
        mContext,
        2000,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("'뒤로' 버튼을 한 번 더 누르시면 종료됩니다.")],
        ),
      );

      return Future.value(false);
    }

    return Future.value(true);
  }
}
