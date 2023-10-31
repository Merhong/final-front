import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/dto/user_dto/interest_webtoon_DTO.dart';
import 'package:flutter_blog/data/provider/param_provider.dart';
import 'package:flutter_blog/ui/common_widgets/specially_tag.dart';
import 'package:flutter_blog/ui/common_widgets/title_tag.dart';
import 'package:flutter_blog/ui/pages/other/my_page/my_interest_webtoon_view_model.dart';
import 'package:flutter_blog/ui/pages/webtoon/detail_page/webtoon_detail_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class MyInterestWebtoon extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<InterestWebtoonDTO> interestWebtoonDTOList = ref.watch(myPageProvider)!.interestWebtoonDTOList;

    return Column(
      children: [
        Divider(color: Colors.grey, height: 1),
        Container(
          child: Padding(
            padding: EdgeInsets.fromLTRB(sizePaddingLR17, sizeM10, sizePaddingLR17, sizeM10),
            child: Row(
              children: [
                Text("전체${interestWebtoonDTOList.length}", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                SizedBox(width: sizeL20),
                Text("업데이트 순", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                Text("▼"),
                Spacer(),
                Text("편집", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),
        Divider(color: Colors.grey, height: 1),
        Expanded(
          child: ListView.builder(
            itemCount: interestWebtoonDTOList.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(sizePaddingLR17, sizeS5, sizePaddingLR17, sizeS5),
                    child: Row(
                      children: [
                        // 왼쪽에 이미지를 배치
                        ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          child: InkWell(
                            onTap: () {
                              ParamStore ps = ref.read(paramProvider);
                              ps.addWebtoonDetailId(interestWebtoonDTOList[index].webtoonId);
                              ps.addBottomNavigationBarIndex(0);
                              Navigator.push(context, MaterialPageRoute(builder: (_) => WebtoonDetailPage()));
                            },
                            child: Stack(
                              children: [
                                Image.network(
                                  "${imageURL}/EpisodeThumbnail/${interestWebtoonDTOList[index].webtoonImage}",
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
                                interestWebtoonDTOList[index].webtoonSpeciallyEnum == "신작"
                                    ? SpeciallyTag(speciallyTagEnum: SpeciallyTagEnum.isNew)
                                    : interestWebtoonDTOList[index].webtoonSpeciallyEnum == "무료"
                                        ? SpeciallyTag(speciallyTagEnum: SpeciallyTagEnum.free)
                                        : interestWebtoonDTOList[index].webtoonSpeciallyEnum == "순위"
                                            ? Container(
                                                height: sizeGetScreenWidth(context) * 0.18,
                                                width: sizeGetScreenWidth(context) * 0.25,
                                                child: SpeciallyTag(speciallyTagEnum: SpeciallyTagEnum.rank),
                                              )
                                            : SizedBox()
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        // 중앙에 제목과 날짜 배치
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "${interestWebtoonDTOList[index].webtoonTitle}",
                                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(width: 3),
                                  interestWebtoonDTOList[index].webtoonUpdateAt == null
                                      ? SizedBox()
                                      : interestWebtoonDTOList[index].webtoonSpeciallyEnum == "완결"
                                          ? TitleTag(titleTagEnum: TitleTagEnum.end)
                                          : interestWebtoonDTOList[index].webtoonSpeciallyEnum == "휴재"
                                              ? TitleTag(titleTagEnum: TitleTagEnum.stop)
                                              : todayDateTime.difference(interestWebtoonDTOList[index].webtoonUpdateAt!).inHours < 40
                                                  ? TitleTag(titleTagEnum: TitleTagEnum.up)
                                                  : SizedBox()
                                ],
                              ),
                              SizedBox(height: sizeS5),
                              Text(
                                "${DateFormat('yyyy-MM-dd').format(interestWebtoonDTOList[index].createdAt)}",
                                style: TextStyle(color: Colors.grey[600], fontSize: 13),
                              ),
                              SizedBox(height: sizeS5),
                              interestWebtoonDTOList[index].webtoonUpdateAt != null &&
                                      todayDateTime.difference(interestWebtoonDTOList[index].webtoonUpdateAt!).inHours < 40
                                  ? RichText(
                                      text: TextSpan(
                                        text: "새 이야기 ",
                                        style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.black),
                                        children: [
                                          TextSpan(text: "등록!", style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.green)),
                                        ],
                                      ),
                                    )
                                  : interestWebtoonDTOList[index].webtoonSpeciallyEnum == "무료"
                                      ? Text("무료 충전 완료!", style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.green))
                                      : SizedBox(),
                            ],
                          ),
                        ),
                        InkWell(
                          child: interestWebtoonDTOList[index].isAlarm != true
                              ? Icon(Icons.notifications, color: Colors.green)
                              : Icon(Icons.notifications_off_outlined, color: Colors.grey),
                          onTap: () {
                            ref.read(myPageProvider.notifier).notifyMyInterestAlarm(interestWebtoonDTOList[index]);
                            print("알람설정");
                          },
                        )
                      ],
                    ),
                  ),
                  Divider(color: Colors.grey, height: 1),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
