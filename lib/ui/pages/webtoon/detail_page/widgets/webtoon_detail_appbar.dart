import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/common_widgets/my_stackbar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../_core/constants/size.dart';
import '../../../../../data/dto/webtoon_DTO/detail_page_webtoon_DTO.dart';
import '../webtoon_detail_view_model.dart';

class WebtoonDetailAppbar extends ConsumerWidget implements PreferredSizeWidget {
  final bool isScroll;
  final DetailPageWebtoonDTO webtoonDTO;

  const WebtoonDetailAppbar(this.isScroll, this.webtoonDTO);

  @override
  Size get preferredSize {
    return Size.fromHeight(kToolbarHeight);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      leading: BackButton(color: !isScroll ? Colors.white : Colors.black),
      title: Text("${webtoonDTO.title}", style: TextStyle(fontWeight: FontWeight.bold, color: !isScroll ? Colors.transparent : Colors.black)),
      actions: [
        webtoonDTO.isInterest == true
            ? Row(
                children: [
                  InkWell(
                    onTap: () {
                      ScaffoldMessenger.of(context).clearSnackBars();
                      ref.read(webtoonDetailProvider.notifier).notifyInterestDelete();
                      mySnackbar(
                        context,
                        1000,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.sentiment_very_dissatisfied, color: IdToColor(webtoonDTO.id)),
                            Text(" 관심 웹툰을 해제하였습니다."),
                          ],
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        Icon(CupertinoIcons.check_mark_circled_solid, color: !isScroll ? Colors.white : Colors.black),
                        Text("관심", style: TextStyle(fontSize: 18, color: !isScroll ? Colors.white : Colors.black)),
                      ],
                    ),
                  ),
                  SizedBox(width: sizeM10),
                  webtoonDTO.isAlarm == true
                      ? InkWell(
                          onTap: () {
                            ScaffoldMessenger.of(context).clearSnackBars();
                            ref.read(webtoonDetailProvider.notifier).notifyInterestAlarmOff();
                            mySnackbar(
                              context,
                              1000,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.sentiment_very_dissatisfied, color: IdToColor(webtoonDTO.id)),
                                  Text(" 웹툰 등록 알림을 껐습니다."),
                                ],
                              ),
                            );
                          },
                          child: Icon(Icons.notifications_on, color: !isScroll ? Colors.white : Colors.black))
                      : InkWell(
                          onTap: () {
                            ScaffoldMessenger.of(context).clearSnackBars();
                            ref.read(webtoonDetailProvider.notifier).notifyInterestAlarmOn();
                            mySnackbar(
                              context,
                              1000,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.add_reaction_outlined, color: IdToColor(webtoonDTO.id)),
                                  Text(" 웹툰 등록 알림을 켰습니다."),
                                ],
                              ),
                            );
                          },
                          child: Icon(Icons.notifications_off_outlined, color: !isScroll ? Colors.white : Colors.black)),
                  SizedBox(width: sizeL20),
                ],
              )
            : InkWell(
                onTap: () {
                  ScaffoldMessenger.of(context).clearSnackBars();
                  ref.read(webtoonDetailProvider.notifier).notifyInterestCreate();
                  mySnackbar(
                    context,
                    1000,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add_reaction_outlined, color: IdToColor(webtoonDTO.id)),
                        Text(" 관심 웹툰으로 등록하였습니다."),
                      ],
                    ),
                  );
                },
                child: Row(
                  children: [
                    Icon(CupertinoIcons.plus_circle),
                    Text("관심 추가", style: TextStyle(color: !isScroll ? Colors.white : Colors.black, fontSize: 18)),
                    SizedBox(width: sizeL20),
                  ],
                ),
              ),
        // IconButton(
        //   onPressed: () {},
        //   icon: Icon(Icons.more_vert, color: !isScroll ? Colors.white : Colors.black),
        // )
      ],
      elevation: 0,
      backgroundColor: !isScroll ? Colors.transparent : Colors.white,
      shape: isScroll ? Border(bottom: BorderSide(color: Colors.grey, width: 1)) : Border(),
    );
  }
}

// SnackBar buildDetailPageSnackBar(BuildContext context, int id, String snackbarStr, IconData snackbarIcon) {
//   return SnackBar(
//     content: Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Icon(snackbarIcon, color: IdToColor(id)),
//         Text("${snackbarStr}"),
//       ],
//     ),
//     duration: Duration(milliseconds: 1000),
//     behavior: SnackBarBehavior.floating,
//     width: sizeGetScreenWidth(context) * 0.8,
//   );
// }
