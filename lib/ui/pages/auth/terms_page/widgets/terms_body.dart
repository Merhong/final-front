import 'package:flutter/material.dart';

class TermsBody extends StatefulWidget {
  const TermsBody({super.key});

  @override
  State<TermsBody> createState() => _TermsBodyState();
}

class _TermsBodyState extends State<TermsBody> {
  bool isTermsAccepted = true; // 초기 체크 상태

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(
            "서비스 이용 약관\n"
            "제1조 (목적)\n"
            "이 약관은 네이버(이하 '회사'라 함)와 본 서비스를 이용하는 고객(이하 '회원'이라 함)간의 관계를 정의하고 이용자의 서비스 이용과 관련된 회사의 권리, 의무, 책임사항 및 기타 필요한 사항을 규정함을 목적으로 합니다.",
          ),
          SizedBox(height: 16),
          Column(
            children: [
              Row(
                children: [
                  Checkbox(
                    value: isTermsAccepted, // 초기 체크 상태 설정
                    onChanged: (value) {
                      // 체크박스 상태 변경 로직 추가
                    },
                  ),
                  Text(
                    "[필수]",
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold, // 텍스트 굵게 표시
                    ),
                  ),
                  Text(
                    "네이버 이용약관",
                    style: TextStyle(
                      fontWeight: FontWeight.bold, // 텍스트 굵게 표시
                    ),
                  ),
                ],
              ),
              Container(
                child: Text("네이버 이용약관"),
              )
            ],
          ),
          Column(
            children: [
              Row(
                children: [
                  Checkbox(
                    value: isTermsAccepted, // 초기 체크 상태 설정
                    onChanged: (value) {
                      // 체크박스 상태 변경 로직 추가
                    },
                  ),
                  Text(
                    "[필수]",
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold, // 텍스트 굵게 표시
                    ),
                  ),
                  Text(
                    "개인정보 수집 및 이용",
                    style: TextStyle(
                      fontWeight: FontWeight.bold, // 텍스트 굵게 표시
                    ),
                  ),
                ],
              ),
              Container(
                child: Text("네이버 이용약관"),
              )
            ],
          ),
          Column(
            children: [
              Row(
                children: [
                  Checkbox(
                    value: isTermsAccepted, // 초기 체크 상태 설정
                    onChanged: (value) {
                      // 체크박스 상태 변경 로직 추가
                    },
                  ),
                  Text(
                    "[선택]",
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold, // 텍스트 굵게 표시
                    ),
                  ),
                  Text(
                    "실명 인증된 아이디로 가입",
                    style: TextStyle(
                      fontWeight: FontWeight.bold, // 텍스트 굵게 표시
                    ),
                  ),
                ],
              ),
              Container(
                child: Text("네이버 이용약관"),
              )
            ],
          ),
          Column(
            children: [
              Row(
                children: [
                  Checkbox(
                    value: isTermsAccepted, // 초기 체크 상태 설정
                    onChanged: (value) {
                      // 체크박스 상태 변경 로직 추가
                    },
                  ),
                  Text(
                    "[선택]",
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold, // 텍스트 굵게 표시
                    ),
                  ),
                  Text(
                    "위치기반서비스 이용약관",
                    style: TextStyle(
                      fontWeight: FontWeight.bold, // 텍스트 굵게 표시
                    ),
                  ),
                ],
              ),
              Container(
                child: Text("네이버 이용약관"),
              )
            ],
          ),
          Row(
            children: [
              Checkbox(
                value: isTermsAccepted, // 초기 체크 상태 설정
                onChanged: (value) {
                  // 체크박스 상태 변경 로직 추가
                },
              ),
              Text(
                "[선택]",
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold, // 텍스트 굵게 표시
                ),
              ),
              Text(
                "개인정보 수집 및 이용",
                style: TextStyle(
                  fontWeight: FontWeight.bold, // 텍스트 굵게 표시
                ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              // 다음 약관으로 이동하는 로직 추가
            },
            child: Text("다음"),
          ),
        ],
      ),
    );
  }
}
