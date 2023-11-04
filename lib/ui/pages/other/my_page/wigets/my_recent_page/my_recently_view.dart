import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class MyRecentlyView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Divider(color: Colors.grey, height: 1),
        Container(
          child: Padding(
            padding: EdgeInsets.fromLTRB(sizePaddingLR17, sizeM10, sizePaddingLR17, sizeM10),
            child: Row(
              children: [
                Text("전체 123", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                SizedBox(width: sizeL20),
                Text("지금 볼 33", style: TextStyle(color: Colors.grey[500], fontWeight: FontWeight.bold)),
                Spacer(),
                // isUpdateButton == true ? Text("편집", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)) : SizedBox(),
                Text("편집", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),
        Divider(color: Colors.grey, height: 1),
        Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) => Divider(color: Colors.grey, height: 1),
            itemCount: 3,
            // itemCount: interestWebtoonDTOList.length,
            itemBuilder: (context, index) {
              return Container(
                height: 85,
                padding: EdgeInsets.fromLTRB(sizePaddingLR17, sizeS5, sizePaddingLR17, sizeS5),
                child: Row(
                  children: [
                    ////

                    ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      child: InkWell(
                        // onTap: () {
                        // ParamStore ps = ref.read(paramProvider);
                        // ps.addWebtoonDetailId(interestWebtoonDTO.webtoonId);
                        // ps.addBottomNavigationBarIndex(0);
                        // Navigator.push(context, MaterialPageRoute(builder: (_) => WebtoonDetailPage()));
                        // },
                        child: Stack(
                          children: [
                            Image.network(
                              // "${imageURL}/EpisodeThumbnail/${interestWebtoonDTO.webtoonImage}",
                              "AAAAAAA",
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
                            // interestWebtoonDTO.webtoonSpeciallyEnum == "신작"
                            //     ? SpeciallyTag(speciallyTagEnum: SpeciallyTagEnum.isNew)
                            //     : interestWebtoonDTO.webtoonSpeciallyEnum == "무료"
                            //         ? SpeciallyTag(speciallyTagEnum: SpeciallyTagEnum.free)
                            //         : interestWebtoonDTO.webtoonSpeciallyEnum == "순위"
                            //             ? Container(
                            //                 height: sizeGetScreenWidth(context) * 0.18,
                            //                 width: sizeGetScreenWidth(context) * 0.25,
                            //                 child: SpeciallyTag(speciallyTagEnum: SpeciallyTagEnum.rank),
                            //               )
                            //             : SizedBox()
                          ],
                        ),
                      ),
                    ),

                    ////

                    SizedBox(width: sizeM10),

                    ////

                    Expanded(
                      child: InkWell(
                        // onTap: () {
                        //   ParamStore ps = ref.read(paramProvider);
                        //   ps.addWebtoonDetailId(interestWebtoonDTOList[index].webtoonId);
                        //   ps.addBottomNavigationBarIndex(0);
                        //   Navigator.push(context, MaterialPageRoute(builder: (_) => WebtoonDetailPage()));
                        // },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Container(
                                  constraints: BoxConstraints(maxWidth: sizeGetScreenWidth(context) * 0.4),
                                  child: Text(
                                    "asdas",
                                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis),
                                  ),
                                ),
                                SizedBox(width: 3),
                                // interestWebtoonDTOList[index].webtoonUpdateAt == null
                                //     ? SizedBox()
                                //     : interestWebtoonDTOList[index].webtoonSpeciallyEnum == "완결"
                                //         ? TitleTag(titleTagEnum: TitleTagEnum.end)
                                //         : interestWebtoonDTOList[index].webtoonSpeciallyEnum == "휴재"
                                //             ? TitleTag(titleTagEnum: TitleTagEnum.stop)
                                //             : todayDateTime.difference(interestWebtoonDTOList[index].webtoonUpdateAt!).inHours < 50
                                //                 ? TitleTag(titleTagEnum: TitleTagEnum.up)
                                //                 : SizedBox()
                              ],
                            ),
                            SizedBox(height: 3),
                            Text(
                              // "${DateFormat('yyyy-MM-dd').format(interestWebtoonDTOList[index].createdAt)}",
                              "1111-11-11",
                              style: TextStyle(color: Colors.grey[600], fontSize: 13),
                            ),
                            SizedBox(height: 3),
                            // interestWebtoonDTOList[index].webtoonUpdateAt != null &&
                            //         todayDateTime.difference(interestWebtoonDTOList[index].webtoonUpdateAt!).inHours < 50
                            //     ? RichText(
                            //         text:
                            //             // TextSpan(
                            //             //   text: "새 이야기 ",
                            //             //   style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.black),
                            //             //   children: [
                            //             //     TextSpan(text: "등록!", style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.green)),
                            //             //   ],
                            //             // ),
                            //             TextSpan(
                            //         text: DateTime.now().difference(interestWebtoonDTOList[index].webtoonUpdateAt!).inHours >= 1
                            //             ? "${DateTime.now().difference(interestWebtoonDTOList[index].webtoonUpdateAt!).inHours}시간 전 "
                            //             : DateTime.now().difference(interestWebtoonDTOList[index].webtoonUpdateAt!).inMinutes >= 1
                            //                 ? "${DateTime.now().difference(interestWebtoonDTOList[index].webtoonUpdateAt!).inMinutes}분 전 "
                            //                 : DateTime.now().difference(interestWebtoonDTOList[index].webtoonUpdateAt!).inSeconds >= 5
                            //                     ? "${DateTime.now().difference(interestWebtoonDTOList[index].webtoonUpdateAt!).inSeconds}초 전 "
                            //                     : "지금 ",
                            //         style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.green),
                            //         children: [
                            //           TextSpan(text: "새 이야기", style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.black)),
                            //         ],
                            //       ))
                            //     : interestWebtoonDTOList[index].webtoonSpeciallyEnum == "무료"
                            //         ? Text("무료 충전 완료!", style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.green))
                            //         : SizedBox(),
                          ],
                        ),
                      ),
                    ),

                    ////

                    SizedBox(width: sizeL20),
                    // buildAlarmButton(ref, interestWebtoonDTOList, index, context),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
