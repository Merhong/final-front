import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/dto/user_dto/interest_webtoon_DTO.dart';
import 'package:flutter_blog/data/provider/param_provider.dart';
import 'package:flutter_blog/ui/common_widgets/my_stackbar.dart';
import 'package:flutter_blog/ui/common_widgets/specially_tag.dart';
import 'package:flutter_blog/ui/common_widgets/title_tag.dart';
import 'package:flutter_blog/ui/pages/other/my_page/my_interest_webtoon_view_model.dart';
import 'package:flutter_blog/ui/pages/other/my_page/wigets/my_interest_webtoon_page/my_interest_webtoon_top_menu.dart';
import 'package:flutter_blog/ui/pages/webtoon/detail_page/webtoon_detail_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class MyInterestWebtoon extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    MyWebtoonPageModel? model = ref.watch(myWebtoonPageProvider);
    if (model == null) {
      return Center(child: CircularProgressIndicator());
    }
    List<InterestWebtoonDTO> interestWebtoonDTOList = model.interestWebtoonDTOList;
    // List<InterestWebtoonDTO> interestWebtoonDTOList = ref.watch(myPageProvider)!.interestWebtoonDTOList;

    if (model.sortCheck == "등록 순") {
      interestWebtoonDTOList.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    }

    if (model.sortCheck == "가나다 순") {
      interestWebtoonDTOList.sort((a, b) => a.webtoonTitle!.compareTo(b.webtoonTitle!));
    }

    if (model.sortCheck == "새소식 순") {
      interestWebtoonDTOList.sort((a, b) => (b.webtoonUpdateAt ?? DateTime(0)).compareTo(a.webtoonUpdateAt ?? DateTime(0)));
    }

    return Column(
      children: [
        Divider(color: Colors.black26, height: 1, thickness: 1),
        MyInterestWebtoonTopMenu(allLength: interestWebtoonDTOList.length, isUpdateButton: true),
        Divider(color: Colors.black26, height: 1, thickness: 1),
        Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) => Divider(color: Colors.black26, height: 1, thickness: 1),
            itemCount: interestWebtoonDTOList.length,
            itemBuilder: (context, index) {
              return Container(
                height: 85,
                padding: EdgeInsets.fromLTRB(sizePaddingLR17, sizeS5, sizePaddingLR17, sizeS5),
                child: Row(
                  children: [
                    buildPhoto(ref, interestWebtoonDTOList[index], context),
                    SizedBox(width: sizeM10),
                    buildDescription(ref, interestWebtoonDTOList[index], context),
                    SizedBox(width: sizeL20),
                    buildAlarmButton(ref, interestWebtoonDTOList[index], context),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  //

  InkWell buildAlarmButton(WidgetRef ref, InterestWebtoonDTO interestWebtoonDTO, BuildContext context) {
    return InkWell(
      child: interestWebtoonDTO.isAlarm == true
          ? Icon(Icons.notifications, color: Colors.green)
          : Icon(Icons.notifications_off_outlined, color: Colors.grey),
      onTap: () {
        ref.read(myWebtoonPageProvider.notifier).notifyMyInterestAlarm(interestWebtoonDTO);
        print("알람설정");
        ScaffoldMessenger.of(context).clearSnackBars();
        mySnackbar(
          context,
          1000,
          interestWebtoonDTO.isAlarm == true
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.sentiment_very_dissatisfied, color: IdToColor(interestWebtoonDTO.webtoonId)),
                    Text(" 웹툰 등록 알림을 껐습니다."),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add_reaction_outlined, color: IdToColor(interestWebtoonDTO.webtoonId)),
                    Text(" 웹툰 등록 알림을 켰습니다."),
                  ],
                ),
        );
      },
    );
  }

  Widget buildDescription(WidgetRef ref, InterestWebtoonDTO interestWebtoonDTO, BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          ParamStore ps = ref.read(paramProvider);
          ps.addWebtoonDetailId(interestWebtoonDTO.webtoonId);
          ps.addBottomNavigationBarIndex(0);
          Navigator.push(context, MaterialPageRoute(builder: (_) => WebtoonDetailPage()));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Container(
                  constraints: BoxConstraints(maxWidth: sizeGetScreenWidth(context) * 0.4),
                  child: Text(
                    "${interestWebtoonDTO.webtoonTitle}",
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis),
                  ),
                ),
                SizedBox(width: 3),
                interestWebtoonDTO.webtoonUpdateAt == null
                    ? SizedBox()
                    : interestWebtoonDTO.webtoonSpeciallyEnum == "완결"
                        ? TitleTag(titleTagEnum: TitleTagEnum.end)
                        : interestWebtoonDTO.webtoonSpeciallyEnum == "휴재"
                            ? TitleTag(titleTagEnum: TitleTagEnum.stop)
                            : DateTime.now().difference(interestWebtoonDTO.webtoonUpdateAt!).inHours < 50
                                ? TitleTag(titleTagEnum: TitleTagEnum.up)
                                : SizedBox()
              ],
            ),
            SizedBox(height: 3),
            Text(
              "${DateFormat('yyyy-MM-dd').format(interestWebtoonDTO.createdAt)}",
              style: TextStyle(color: Colors.grey[600], fontSize: 13),
            ),
            SizedBox(height: 3),
            interestWebtoonDTO.webtoonUpdateAt != null && DateTime.now().difference(interestWebtoonDTO.webtoonUpdateAt!).inHours < 50
                ? RichText(
                    text:
                        // TextSpan(
                        //   text: "새 이야기 ",
                        //   style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.black),
                        //   children: [
                        //     TextSpan(text: "등록!", style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.green)),
                        //   ],
                        // ),
                        TextSpan(
                    text: DateTime.now().difference(interestWebtoonDTO.webtoonUpdateAt!).inHours >= 1
                        ? "${DateTime.now().difference(interestWebtoonDTO.webtoonUpdateAt!).inHours}시간 전 "
                        : DateTime.now().difference(interestWebtoonDTO.webtoonUpdateAt!).inMinutes >= 1
                            ? "${DateTime.now().difference(interestWebtoonDTO.webtoonUpdateAt!).inMinutes}분 전 "
                            : DateTime.now().difference(interestWebtoonDTO.webtoonUpdateAt!).inSeconds >= 5
                                ? "${DateTime.now().difference(interestWebtoonDTO.webtoonUpdateAt!).inSeconds}초 전 "
                                : "지금 ",
                    style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.green),
                    children: [
                      TextSpan(text: "새 이야기", style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.black)),
                    ],
                  ))
                : interestWebtoonDTO.webtoonSpeciallyEnum == "무료"
                    ? Text("무료 충전 완료!", style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.green))
                    : SizedBox(),
          ],
        ),
      ),
    );
  }

  Widget buildPhoto(WidgetRef ref, InterestWebtoonDTO interestWebtoonDTO, BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(5)),
      child: InkWell(
        onTap: () {
          ParamStore ps = ref.read(paramProvider);
          ps.addWebtoonDetailId(interestWebtoonDTO.webtoonId);
          ps.addBottomNavigationBarIndex(0);
          Navigator.push(context, MaterialPageRoute(builder: (_) => WebtoonDetailPage()));
        },
        child: Stack(
          children: [
            Image.network(
              "${imageURL}/EpisodeThumbnail/${interestWebtoonDTO.webtoonImage}",
              height: sizeGetScreenWidth(context) * 0.18,
              width: sizeGetScreenWidth(context) * 0.25,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Image.asset(
                  "assets/default_episode_Thumbnail.jpg",
                  height: sizeGetScreenWidth(context) * 0.18,
                  width: sizeGetScreenWidth(context) * 0.25,
                  fit: BoxFit.cover,
                );
              },
            ),
            interestWebtoonDTO.webtoonSpeciallyEnum == "신작"
                ? SpeciallyTag(speciallyTagEnum: SpeciallyTagEnum.isNew)
                : interestWebtoonDTO.webtoonSpeciallyEnum == "무료"
                    ? SpeciallyTag(speciallyTagEnum: SpeciallyTagEnum.free)
                    : interestWebtoonDTO.webtoonSpeciallyEnum == "순위"
                        ? Container(
                            height: sizeGetScreenWidth(context) * 0.18,
                            width: sizeGetScreenWidth(context) * 0.25,
                            child: SpeciallyTag(speciallyTagEnum: SpeciallyTagEnum.rank),
                          )
                        : SizedBox()
          ],
        ),
      ),
    );
  }
}
