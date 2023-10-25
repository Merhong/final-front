import 'package:flutter/material.dart';

class JoinFormContainerTop extends StatelessWidget {
  TextEditingController _email;
  TextEditingController _password;
  TextEditingController _emailCheck;

  JoinFormContainerTop(this._email, this._password, this._emailCheck);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        children: [
          TextFormField(
            controller: _email,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.person),
              labelText: "아이디                             @naver.com",
              hintText: "example@example.com",
            ),
          ),
          SizedBox(height: 16),
          TextFormField(
            controller: _password,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.lock),
              labelText: "비밀번호",
              hintText: "********",
            ),
            obscureText: true, // 비밀번호 필드로 설정
          ),
          TextFormField(
            controller: _emailCheck,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.email),
              labelText: "[선택] 비밀번호 분실시 확인용 이메일",
              hintText: "example@example.com",
            ),
            obscureText: true,
          ),
        ],
      ),
    );
  }
}
