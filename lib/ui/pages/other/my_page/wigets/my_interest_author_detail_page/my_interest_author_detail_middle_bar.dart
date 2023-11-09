import 'package:flutter/material.dart';
import 'package:flutter_blog/data/dto/user_dto/interest_author_detail_DTO.dart';

class MyInterestAuthorDetailMiddleBar extends StatefulWidget {
  InterestAuthorDetailDTO interestAuthorDetailDTO;

  MyInterestAuthorDetailMiddleBar(this.interestAuthorDetailDTO);

  @override
  State<MyInterestAuthorDetailMiddleBar> createState() => _MyInterestAuthorDetailMiddleBarState();
}

class _MyInterestAuthorDetailMiddleBarState extends State<MyInterestAuthorDetailMiddleBar> {
  bool isButtonPressed = false;
  Color buttonBackgroundColor = Colors.white; // 기본 버튼 배경 색상
  Color buttonTextColor = Colors.black; // 기본 버튼 텍스트 색상

  //각각이 Text여서 자기 크기만큼만 잡음 (=인라인)
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 240.0,
            child: OutlinedButton(
              onPressed: () {
                setState(() {
                  isButtonPressed = !isButtonPressed;
                  if (isButtonPressed) {
                    buttonBackgroundColor = Colors.green; // 클릭 시 배경 색상 변경
                    buttonTextColor = Colors.white; // 클릭 시 텍스트 색상 변경
                  } else {
                    buttonBackgroundColor = Colors.white; // 원래 색상 복원
                    buttonTextColor = Colors.black; // 원래 색상 복원
                  }
                  //왜이렇게 되는지 물어보기
                });
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(buttonBackgroundColor), // 배경 색상
                foregroundColor: MaterialStateProperty.all(buttonTextColor), //, // 눌린 상태와 눌리지 않은 상태에 따른 배경 색상 설정
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("+"),
                  SizedBox(
                    width: 15,
                  ),
                  Text("관심"),
                  SizedBox(width: 15),
                  Text("${widget.interestAuthorDetailDTO.interestCount}")
                ],
              ),
            ),
          ),
          Container(
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
            child: Icon(
              Icons.share_rounded,
              color: Colors.black,
            ),
          )),
          Container(
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
