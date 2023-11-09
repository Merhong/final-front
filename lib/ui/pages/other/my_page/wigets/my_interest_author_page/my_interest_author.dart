import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/dto/user_dto/interest_author_DTO.dart';
import 'package:flutter_blog/data/dto/user_dto/recommend_author_DTO.dart';
import 'package:flutter_blog/data/provider/param_provider.dart';
import 'package:flutter_blog/ui/common_widgets/my_stackbar.dart';
import 'package:flutter_blog/ui/common_widgets/title_tag.dart';
import 'package:flutter_blog/ui/pages/other/my_page/my_interest_author_detail_page.dart';
import 'package:flutter_blog/ui/pages/other/my_page/my_interest_author_view_model.dart';
import 'package:flutter_blog/ui/pages/other/my_page/wigets/my_interest_author_page/my_interest_author_top_menu.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyInterestAuthor extends ConsumerStatefulWidget {
  @override
  _MyInterestAuthorState createState() => _MyInterestAuthorState();
}

class _MyInterestAuthorState extends ConsumerState<MyInterestAuthor> {
  @override
  Widget build(BuildContext context) {
    MyAuthorPageModel? model = ref.watch(myAuthorPageProvider);
    if (model == null) {
      return Center(child: CircularProgressIndicator());
    }

    List<InterestAuthorDTO> interestAuthorDTOList =
        model.myInterestAuthorAllDTO.interestAuthorDTOList;
    List<RecommendAuthorDTO> recommendAuthorDTOList =
        model.myInterestAuthorAllDTO.recommendAuthorDTOList;

    // List<InterestAuthorDTO> interestAuthorDTOList = ref.watch(myAuthorPageProvider)!.interestAuthorDTOList;

    recommendAuthorDTOList.sort((a, b) => a.authorId.compareTo(b.authorId));
    if (model.sortCheck == "등록 순") {
      interestAuthorDTOList.sort((a, b) => b.createdAt.compareTo(a.createdAt));
      recommendAuthorDTOList.sort((a, b) => a.authorId.compareTo(b.authorId));
    }

    if (model.sortCheck == "가나다 순") {
      interestAuthorDTOList
          .sort((a, b) => a.authorNickname!.compareTo(b.authorNickname!));
      recommendAuthorDTOList
          .sort((a, b) => a.authorNickname!.compareTo(b.authorNickname!));
    }

    if (model.sortCheck == "새소식 순") {
      interestAuthorDTOList.sort((a, b) =>
          (b.authorBoardCreateAt ?? DateTime(0))
              .compareTo(a.authorBoardCreateAt ?? DateTime(0)));
      recommendAuthorDTOList.sort((a, b) =>
          (b.authorBoardCreateAt ?? DateTime(0))
              .compareTo(a.authorBoardCreateAt ?? DateTime(0)));
    }

    return Column(
      children: [
        Divider(color: Colors.black26, height: 1, thickness: 1),
        MyInterestAuthorTopMenu(allLength: interestAuthorDTOList.length),
        Divider(color: Colors.black26, height: 1, thickness: 1),
        Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) =>
                Divider(color: Colors.black26, height: 1, thickness: 1),
            itemCount:
                interestAuthorDTOList.length + recommendAuthorDTOList.length,
            itemBuilder: (context, index) {
              return index >= interestAuthorDTOList.length
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        index == interestAuthorDTOList.length
                            ? Container(
                                padding: EdgeInsets.fromLTRB(
                                    sizePaddingLR17, sizeL20, 0, sizeS5),
                                child: Text("관심작가 추천",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                              )
                            : SizedBox(),
                        Container(
                          height: 85,
                          padding: EdgeInsets.fromLTRB(
                              sizePaddingLR17, sizeS5, sizePaddingLR17, sizeS5),
                          child: Row(
                            children: [
                              buildPhoto(
                                  ref,
                                  context,
                                  recommendAuthorDTOList[
                                          index - interestAuthorDTOList.length]
                                      .authorPhoto!),
                              SizedBox(width: sizeM10),
                              buildRecommendDescription(
                                  ref,
                                  context,
                                  recommendAuthorDTOList[
                                      index - interestAuthorDTOList.length]),
                              SizedBox(width: sizeL20),
                              recommendAuthorDTOList[index -
                                              interestAuthorDTOList.length]
                                          .isInterest ==
                                      true
                                  ? Icon(
                                      CupertinoIcons.check_mark_circled_solid,
                                      color: Colors.green)
                                  : buildRecommendButton(
                                      ref,
                                      context,
                                      recommendAuthorDTOList[index -
                                          interestAuthorDTOList.length]),
                            ],
                          ),
                        ),
                      ],
                    )
                  : Container(
                      height: 85,
                      padding: EdgeInsets.fromLTRB(
                          sizePaddingLR17, sizeS5, sizePaddingLR17, sizeS5),
                      child: Row(
                        children: [
                          buildPhoto(ref, context,
                              interestAuthorDTOList[index].authorPhoto!),
                          SizedBox(width: sizeM10),
                          buildDescription(
                              ref, context, interestAuthorDTOList[index]),
                          SizedBox(width: sizeL20),
                          buildAlarmButton(
                              ref, context, interestAuthorDTOList[index]),
                        ],
                      ),
                    );
            },
          ),
        ),
      ],
    );
  }

  InkWell buildRecommendButton(WidgetRef ref, BuildContext context,
      RecommendAuthorDTO recommendAuthorDTO) {
    return InkWell(
      child: Icon(CupertinoIcons.plus_circle, color: Colors.green),
      onTap: () {
        ref
            .read(myAuthorPageProvider.notifier)
            .notifyMyInterestAdd(recommendAuthorDTO);
        print("관심작가등록");
        ScaffoldMessenger.of(context).clearSnackBars();
        mySnackbar(
          context,
          1000,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.add_reaction_outlined, color: Colors.green),
              Text(" 관심 작가를 등록했습니다."),
            ],
          ),
        );
        recommendAuthorDTO.isInterest = true;
        setState(() {});
      },
    );
  }

  //
  InkWell buildAlarmButton(WidgetRef ref, BuildContext context,
      InterestAuthorDTO interestAuthorDTO) {
    return InkWell(
      child: interestAuthorDTO.isAlarm == true
          ? Icon(Icons.notifications, color: Colors.green)
          : Icon(Icons.notifications_off_outlined, color: Colors.grey),
      onTap: () {
        ref
            .read(myAuthorPageProvider.notifier)
            .notifyMyInterestAlarm(interestAuthorDTO);
        print("알람설정");
        ScaffoldMessenger.of(context).clearSnackBars();
        mySnackbar(
          context,
          1000,
          interestAuthorDTO.isAlarm == true
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.sentiment_very_dissatisfied,
                        color: Colors.grey[400]),
                    Text(" 작가의 글 등록 알림을 껐습니다."),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add_reaction_outlined, color: Colors.green),
                    Text(" 작가의 글 등록 알림을 켰습니다."),
                  ],
                ),
        );
      },
    );
  }

  InkWell buildPhoto(WidgetRef ref, BuildContext context, String photo) {
    return InkWell(
      // onTap: () {
      //   ParamStore ps = ref.read(paramProvider);
      //   ps.addWebtoonDetailId(interestAuthorDTOList[index].authorId);
      //   ps.addBottomNavigationBarIndex(0);
      //   Navigator.push(context, MaterialPageRoute(builder: (_) => WebtoonDetailPage()));
      // },
      child: CircleAvatar(
        backgroundImage: NetworkImage('${imageURL}/AuthorPhoto/${photo}'),
        radius: 37,
      ),
    );
  }
}

Expanded buildDescription(
    WidgetRef ref, BuildContext context, InterestAuthorDTO interestAuthorDTO) {
  return Expanded(
    child: InkWell(
      onTap: () {
        print("네비게이터 작동함000");
        ParamStore ps = ref.read(paramProvider);
        print("네비게이터 작동함1111");
        ps.addauthMoveId(interestAuthorDTO.authorId);
        print("네비게이터 작동함222");
        // ps.addBottomNavigationBarIndex(0);
        Navigator.push(context,
            MaterialPageRoute(builder: (_) => MyInterestAuthorDetailPage()));
        print("네비게이터 작동함333");
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
                    constraints: BoxConstraints(
                        maxWidth: sizeGetScreenWidth(context) * 0.6),
                    child: Text(
                      "${interestAuthorDTO.authorNickname}",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis),
                    ),
                  ),
                  SizedBox(width: 3),
                  DateTime.now()
                              .difference(
                                  interestAuthorDTO.authorBoardCreateAt!)
                              .inHours <
                          50
                      ? TitleTag(titleTagEnum: TitleTagEnum.up)
                      : SizedBox()
                ],
              ),
            ],
          ),
          SizedBox(height: 5),
          Container(
            constraints:
                BoxConstraints(maxWidth: sizeGetScreenWidth(context) * 0.6),
            child: Wrap(
              // runSpacing: -2,
              children:
                  interestAuthorDTO.authorWebtoonNameList.map((webtoonName) {
                return Text(
                  "${webtoonName}  ",
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                      fontFamily: "JamsilRegular",
                      overflow: TextOverflow.ellipsis),
                );
              }).toList(),
            ),
          ),
          // SizedBox(height: 3),
          interestAuthorDTO.authorBoardCreateAt != null &&
                  DateTime.now()
                          .difference(interestAuthorDTO.authorBoardCreateAt!)
                          .inHours <
                      100
              ? RichText(
                  text: TextSpan(
                    text: DateTime.now()
                                .difference(
                                    interestAuthorDTO.authorBoardCreateAt!)
                                .inHours >=
                            1
                        ? "${DateTime.now().difference(interestAuthorDTO.authorBoardCreateAt!).inHours}시간 전 "
                        : DateTime.now()
                                    .difference(
                                        interestAuthorDTO.authorBoardCreateAt!)
                                    .inMinutes >=
                                1
                            ? "${DateTime.now().difference(interestAuthorDTO.authorBoardCreateAt!).inMinutes}분 전 "
                            : DateTime.now()
                                        .difference(interestAuthorDTO
                                            .authorBoardCreateAt!)
                                        .inSeconds >=
                                    5
                                ? "${DateTime.now().difference(interestAuthorDTO.authorBoardCreateAt!).inSeconds}초 전 "
                                : "지금 ",
                    style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                    children: [
                      TextSpan(
                          text: "새 소식",
                          style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
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

Expanded buildRecommendDescription(WidgetRef ref, BuildContext context,
    RecommendAuthorDTO recommendAuthorDTO) {
  return Expanded(
    child: InkWell(
      onTap: () {
        // ParamStore ps = ref.read(paramProvider);
        // ps.addWebtoonDetailId(interestAuthorDTOList[index].authorId);
        // ps.addBottomNavigationBarIndex(0);
        Navigator.push(context,
            MaterialPageRoute(builder: (_) => MyInterestAuthorDetailPage()));
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
                    constraints: BoxConstraints(
                        maxWidth: sizeGetScreenWidth(context) * 0.6),
                    child: Text(
                      "${recommendAuthorDTO.authorNickname}",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis),
                    ),
                  ),
                  SizedBox(width: 3),
                  DateTime.now()
                              .difference(
                                  recommendAuthorDTO.authorBoardCreateAt!)
                              .inHours <
                          50
                      ? TitleTag(titleTagEnum: TitleTagEnum.up)
                      : SizedBox()
                ],
              ),
            ],
          ),
          // SizedBox(height: 2),
          Container(
            constraints:
                BoxConstraints(maxWidth: sizeGetScreenWidth(context) * 0.6),
            child: RichText(
              text: TextSpan(
                style: TextStyle(color: Colors.black),
                children: [
                  TextSpan(
                      text: "관심웹툰",
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                          fontFamily: "JamsilRegular",
                          overflow: TextOverflow.ellipsis)),
                  TextSpan(
                      text: " ${recommendAuthorDTO.webtoonTitle}",
                      style: TextStyle(
                          color: Colors.green, fontWeight: FontWeight.bold)),
                  TextSpan(
                      text: "의",
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                          fontFamily: "JamsilRegular",
                          overflow: TextOverflow.ellipsis)),
                  TextSpan(text: " 작가", style: TextStyle(color: Colors.black)),
                ],
              ),
            ),
          ),
          // SizedBox(height: 3),
          recommendAuthorDTO.authorBoardCreateAt != null &&
                  DateTime.now()
                          .difference(recommendAuthorDTO.authorBoardCreateAt!)
                          .inHours <
                      100
              ? RichText(
                  text: TextSpan(
                    text: DateTime.now()
                                .difference(
                                    recommendAuthorDTO.authorBoardCreateAt!)
                                .inHours >=
                            1
                        ? "${DateTime.now().difference(recommendAuthorDTO.authorBoardCreateAt!).inHours}시간 전 "
                        : DateTime.now()
                                    .difference(
                                        recommendAuthorDTO.authorBoardCreateAt!)
                                    .inMinutes >=
                                1
                            ? "${DateTime.now().difference(recommendAuthorDTO.authorBoardCreateAt!).inMinutes}분 전 "
                            : DateTime.now()
                                        .difference(recommendAuthorDTO
                                            .authorBoardCreateAt!)
                                        .inSeconds >=
                                    5
                                ? "${DateTime.now().difference(recommendAuthorDTO.authorBoardCreateAt!).inSeconds}초 전 "
                                : "지금 ",
                    style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                    children: [
                      TextSpan(
                          text: "새 소식",
                          style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
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
