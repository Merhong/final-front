import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/dto/user_dto/interest_author_detail_DTO.dart';
import 'package:flutter_blog/ui/common_widgets/my_stackbar.dart';
import 'package:flutter_blog/ui/pages/other/author_page/my_interest_author_detail_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyInterestAuthorDetailMiddleBar extends ConsumerStatefulWidget {
  InterestAuthorDetailDTO interestAuthorDetailDTO;

  MyInterestAuthorDetailMiddleBar(this.interestAuthorDetailDTO);

  @override
  _MyInterestAuthorDetailMiddleBarState createState() => _MyInterestAuthorDetailMiddleBarState();
}

class _MyInterestAuthorDetailMiddleBarState extends ConsumerState<MyInterestAuthorDetailMiddleBar> {
  bool isButtonPressed = false;
  Color buttonBackgroundColor = Color.fromRGBO(150, 150, 150, 0.5); // 기본 버튼 배경 색상
  Color buttonTextColor = Colors.black; // 기본 버튼 텍스트 색상

  //각각이 Text여서 자기 크기만큼만 잡음 (=인라인)
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: sizePaddingLR17),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: (sizeGetScreenWidth(context) - 50) * 0.7,
            child: OutlinedButton(
              onPressed: widget.interestAuthorDetailDTO.isInterest == true
                  ? () {
                      ScaffoldMessenger.of(context).clearSnackBars();
                      ref.read(myAuthorDetailPageProvider.notifier).notifyInterestDelete();
                      mySnackbar(
                        context,
                        1000,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.sentiment_very_dissatisfied, color: Colors.grey),
                            Text(" 관심 작가를 해제하였습니다."),
                          ],
                        ),
                      );
                    }
                  : () {
                      ScaffoldMessenger.of(context).clearSnackBars();
                      ref.read(myAuthorDetailPageProvider.notifier).notifyInterestCreate();
                      mySnackbar(
                        context,
                        1000,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.add_reaction_outlined, color: Colors.green),
                            Text(" 관심 작가로 등록하였습니다."),
                          ],
                        ),
                      );
                    },
              style: ButtonStyle(
                backgroundColor: widget.interestAuthorDetailDTO.isInterest == true
                    ? MaterialStateProperty.all(buttonBackgroundColor)
                    : MaterialStateProperty.all(Colors.green), // 배경 색상
                foregroundColor: MaterialStateProperty.all(buttonTextColor), //, // 눌린 상태와 눌리지 않은 상태에 따른 배경 색상 설정
              ),
              child: widget.interestAuthorDetailDTO.isInterest == true
                  ? Text("✔ 관심 ${widget.interestAuthorDetailDTO.interestCount}")
                  : Text("+ 관심 추가하기  ${widget.interestAuthorDetailDTO.interestCount}"),
            ),
          ),
          Container(
              width: (sizeGetScreenWidth(context) - 40) * 0.15,
              child: OutlinedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("알림"),
                        content: Text("주소가 복사되었습니다."),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(); // AlertDialog 닫기
                            },
                            child: Text(
                              "확인",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(buttonBackgroundColor), // 배경 색상
                  foregroundColor: MaterialStateProperty.all(buttonTextColor), //, // 눌린 상태와 눌리지 않은 상태에 따른 배경 색상 설정
                ),
                child: Icon(
                  Icons.share_rounded,
                  color: Colors.black,
                ),
              )),
          Container(
            width: (sizeGetScreenWidth(context) - 40) * 0.15,
            child: OutlinedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("알림"),
                      content: Text("신고하기"),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(); // AlertDialog 닫기
                          },
                          child: Text("확인", style: TextStyle(color: Colors.black)),
                        ),
                      ],
                    );
                  },
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(buttonBackgroundColor), // 배경 색상
                foregroundColor: MaterialStateProperty.all(buttonTextColor), //, // 눌린 상태와 눌리지 않은 상태에 따른 배경 색상 설정
              ),
              child: Icon(
                Icons.report,
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
    );
  }
}
