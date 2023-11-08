import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/dto/user_dto/interest_author_DTO.dart';
import 'package:flutter_blog/data/dto/user_dto/recommend_author_DTO.dart';
import 'package:flutter_blog/ui/common_widgets/my_stackbar.dart';
import 'package:flutter_blog/ui/common_widgets/title_tag.dart';
import 'package:flutter_blog/ui/pages/other/my_page/my_interest_author_detail_page.dart';
import 'package:flutter_blog/ui/pages/other/my_page/my_interest_author_view_model.dart';
import 'package:flutter_blog/ui/pages/other/my_page/wigets/my_interest_author_page/my_interest_author_top_menu.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyInterestAuthor extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    MyAuthorPageModel? model = ref.watch(myAuthorPageProvider);
    if (model == null) {
      return Center(child: CircularProgressIndicator());
    }

    List<InterestAuthorDTO> interestAuthorDTOList = model.myInterestAuthorAllDTO.interestAuthorDTOList;
    List<RecommendAuthorDTO> recommendAuthorDTOList = model.myInterestAuthorAllDTO.recommendAuthorDTOList;

    // List<InterestAuthorDTO> interestAuthorDTOList = ref.watch(myAuthorPageProvider)!.interestAuthorDTOList;

    if (model.sortCheck == "등록 순") {
      interestAuthorDTOList.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    }

    if (model.sortCheck == "가나다 순") {
      interestAuthorDTOList.sort((a, b) => a.authorNickname!.compareTo(b.authorNickname!));
    }

    if (model.sortCheck == "새소식 순") {
      interestAuthorDTOList.sort((a, b) => (b.authorBoardCreateAt ?? DateTime(0)).compareTo(a.authorBoardCreateAt ?? DateTime(0)));
    }

    return Column(
      children: [
        Divider(color: Colors.black26, height: 1, thickness: 1),
        MyInterestAuthorTopMenu(allLength: interestAuthorDTOList.length),
        Divider(color: Colors.black26),
        Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) => Divider(color: Colors.black26),
            itemCount: interestAuthorDTOList.length,
            itemBuilder: (context, index) {
              return Container(
                height: 85,
                padding: EdgeInsets.fromLTRB(sizePaddingLR17, 0, sizePaddingLR17, sizeS5),
                child: index > interestAuthorDTOList.length
                    ? SizedBox()
                    : Row(
                        children: [
                          buildPhoto(ref, interestAuthorDTOList[index], context), // TODO 클릭시 작가페이지이동
                          SizedBox(width: sizeM10),
                          buildDescription(ref, interestAuthorDTOList[index], context), // TODO 클릭시 작가페이지이동
                          SizedBox(width: sizeL20),
                          buildAlarmButton(ref, interestAuthorDTOList[index], context),
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

  InkWell buildAlarmButton(WidgetRef ref, InterestAuthorDTO interestAuthorDTO, BuildContext context) {
    return InkWell(
      child: interestAuthorDTO.isAlarm == true
          ? Icon(Icons.notifications, color: Colors.green)
          : Icon(Icons.notifications_off_outlined, color: Colors.grey),
      onTap: () {
        ref.read(myAuthorPageProvider.notifier).notifyMyInterestAlarm(interestAuthorDTO);
        print("알람설정");
        ScaffoldMessenger.of(context).clearSnackBars();
        mySnackbar(
          context,
          1000,
          interestAuthorDTO.isAlarm == true
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.sentiment_very_dissatisfied, color: Colors.grey[400]),
                    Text(" 작가의 글 등록 알림을 껐습니다."),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add_reaction_outlined, color: Colors.yellow),
                    Text(" 작가의 글 등록 알림을 켰습니다."),
                  ],
                ),
        );
      },
    );
  }

  Expanded buildDescription(WidgetRef ref, InterestAuthorDTO interestAuthorDTO, BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          // ParamStore ps = ref.read(paramProvider);
          // ps.addWebtoonDetailId(interestAuthorDTOList[index].authorId);
          // ps.addBottomNavigationBarIndex(0);
          Navigator.push(context, MaterialPageRoute(builder: (_) => MyInterestAuthorDetailPage()));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      constraints: BoxConstraints(maxWidth: sizeGetScreenWidth(context) * 0.6),
                      child: Text(
                        "${interestAuthorDTO.authorNickname}",
                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis),
                      ),
                    ),
                    SizedBox(width: 3),
                    DateTime.now().difference(interestAuthorDTO.authorBoardCreateAt!).inHours < 50
                        ? TitleTag(titleTagEnum: TitleTagEnum.up)
                        : SizedBox()
                  ],
                ),
              ],
            ),
            SizedBox(height: 3),
            Container(
              constraints: BoxConstraints(maxWidth: sizeGetScreenWidth(context) * 0.6),
              child: Wrap(
                runSpacing: -2,
                children: interestAuthorDTO.authorWebtoonNameList.map((webtoonName) {
                  return Text(
                    "${webtoonName}  ",
                    style: TextStyle(fontSize: 11, color: Colors.grey[600], overflow: TextOverflow.ellipsis),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 3),
            interestAuthorDTO.authorBoardCreateAt != null && DateTime.now().difference(interestAuthorDTO.authorBoardCreateAt!).inHours < 100
                ? RichText(
                    text: TextSpan(
                      text: DateTime.now().difference(interestAuthorDTO.authorBoardCreateAt!).inHours >= 1
                          ? "${DateTime.now().difference(interestAuthorDTO.authorBoardCreateAt!).inHours}시간 전 "
                          : DateTime.now().difference(interestAuthorDTO.authorBoardCreateAt!).inMinutes >= 1
                              ? "${DateTime.now().difference(interestAuthorDTO.authorBoardCreateAt!).inMinutes}분 전 "
                              : DateTime.now().difference(interestAuthorDTO.authorBoardCreateAt!).inSeconds >= 5
                                  ? "${DateTime.now().difference(interestAuthorDTO.authorBoardCreateAt!).inSeconds}초 전 "
                                  : "지금 ",
                      style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.green),
                      children: [
                        TextSpan(text: "새 소식", style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.black)),
                      ],
                    ),
                  )
                : SizedBox(),
            // Text(
            //     "${DateTime.now().difference(interestAuthorDTOList[index].authorBoardCreateAt!).inDays}일/${DateTime.now().difference(interestAuthorDTOList[index].authorBoardCreateAt!).inHours}시간/${DateTime.now().difference(interestAuthorDTOList[index].authorBoardCreateAt!).inMinutes}분/${DateTime.now().difference(interestAuthorDTOList[index].authorBoardCreateAt!).inSeconds}초")
          ],
        ),
      ),
    );
  }

  InkWell buildPhoto(WidgetRef ref, InterestAuthorDTO interestAuthorDTO, BuildContext context) {
    return InkWell(
      // onTap: () {
      //   ParamStore ps = ref.read(paramProvider);
      //   ps.addWebtoonDetailId(interestAuthorDTOList[index].authorId);
      //   ps.addBottomNavigationBarIndex(0);
      //   Navigator.push(context, MaterialPageRoute(builder: (_) => WebtoonDetailPage()));
      // },
      child: CircleAvatar(
        backgroundImage: NetworkImage('${imageURL}/AuthorPhoto/${interestAuthorDTO.authorPhoto}'),
        radius: 37,
      ),
    );
  }
}
