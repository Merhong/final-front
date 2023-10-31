import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/dto/user_dto/interest_author_DTO.dart';
import 'package:flutter_blog/data/dto/user_dto/interest_webtoon_DTO.dart';
import 'package:flutter_blog/data/provider/param_provider.dart';
import 'package:flutter_blog/ui/common_widgets/my_stackbar.dart';
import 'package:flutter_blog/ui/common_widgets/specially_tag.dart';
import 'package:flutter_blog/ui/common_widgets/title_tag.dart';
import 'package:flutter_blog/ui/pages/other/my_page/my_interest_author_view_model.dart';
import 'package:flutter_blog/ui/pages/other/my_page/my_interest_webtoon_view_model.dart';
import 'package:flutter_blog/ui/pages/webtoon/detail_page/webtoon_detail_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class MyInterestAuthor extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    MyAuthorPageModel? model = ref.watch(myAuthorPageProvider);
    if (model == null) {
      return Center(child: CircularProgressIndicator());
    }
    List<InterestAuthorDTO> interestAuthorDTOList = model.interestAuthorDTOList;
    // List<InterestAuthorDTO> interestAuthorDTOList = ref.watch(myAuthorPageProvider)!.interestAuthorDTOList;

    return Column(
      children: [
        Divider(color: Colors.grey, height: 1),
        Container(
          child: Padding(
            padding: EdgeInsets.fromLTRB(sizePaddingLR17, sizeM10, sizePaddingLR17, sizeM10),
            child: Row(
              children: [
                Text("전체 ${interestAuthorDTOList.length}", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                SizedBox(width: sizeL20),
                Text("업데이트 순", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                Text("▼"),
                // Spacer(),
                // Text("편집", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),
        Divider(color: Colors.grey, height: 1),
        Expanded(
          child: ListView.builder(
            itemCount: interestAuthorDTOList.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(sizePaddingLR17, sizeS5, sizePaddingLR17, sizeS5),
                    child: Row(
                      children: [
                        // 왼쪽에 이미지를 배치

                        InkWell(
                          // onTap: () {
                          //   ParamStore ps = ref.read(paramProvider);
                          //   ps.addWebtoonDetailId(interestAuthorDTOList[index].webtoonId);
                          //   ps.addBottomNavigationBarIndex(0);
                          //   Navigator.push(context, MaterialPageRoute(builder: (_) => WebtoonDetailPage()));
                          // },
                          child: CircleAvatar(
                            backgroundImage: NetworkImage('${imageURL}/AuthorPhoto/${interestAuthorDTOList[index].authorPhoto}'),
                            radius: 35,
                          ),
                        ),
                        SizedBox(width: 10),
                        // 중앙에 제목과 날짜 배치
                        Expanded(
                          child: InkWell(
                            // onTap: () {
                            //   ParamStore ps = ref.read(paramProvider);
                            //   ps.addWebtoonDetailId(interestAuthorDTOList[index].webtoonId);
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
                                        "${interestAuthorDTOList[index].authorNickname}",
                                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: sizeS5),
                                Text(
                                  "${DateFormat('yyyy-MM-dd').format(interestAuthorDTOList[index].createdAt)}",
                                  style: TextStyle(color: Colors.grey[600], fontSize: 13),
                                ),
                                SizedBox(height: sizeS5),
                                interestAuthorDTOList[index].authorBoardCreateAt != null &&
                                        todayDateTime.difference(interestAuthorDTOList[index].authorBoardCreateAt!).inHours < 40
                                    ? RichText(
                                        text: TextSpan(
                                          text: "새 이야기 ",
                                          style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.black),
                                          children: [
                                            TextSpan(text: "등록!", style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.green)),
                                          ],
                                        ),
                                      )
                                    : SizedBox(),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: sizeL20),
                        InkWell(
                          child: interestAuthorDTOList[index].isAlarm == true
                              ? Icon(Icons.notifications, color: Colors.green)
                              : Icon(Icons.notifications_off_outlined, color: Colors.grey),
                          onTap: () {
                            // ref.read(myAuthorPageProvider.notifier).notifyMyInterestAlarm(interestAuthorDTOList[index]);
                            print("알람설정");
                            ScaffoldMessenger.of(context).clearSnackBars();
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
