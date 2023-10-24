import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/pages/auth/join_page/widgets/join_build_container2_buttons.dart';

class JoinBuildContainer2 extends StatelessWidget {
  TextEditingController _username;
  TextEditingController _birthday;
  TextEditingController _gender;
  TextEditingController _tel;

  JoinBuildContainer2(this._username, this._birthday, this._gender, this._tel);

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
          SizedBox(
            height: 70,
            child: TextFormField(
              controller: _username,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person),
                labelText: "이름",
                hintText: "홍길동",
              ),
            ),
          ),
          SizedBox(
            height: 70,
            child: TextFormField(
              controller: _birthday,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.calendar_today), // 달력 아이콘으로 수정
                labelText: "생년월일 8자리",
                hintText: "1997-05-31",
              ),
            ),
          ),
          SizedBox(height: 16),
          JoinBuildContainer2Buttons(),
          TextFormField(
            controller: _tel,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.phone),
              labelText: "휴대전화번호",
              hintText: "010-0000-0000",
            ),
          ),
        ],
      ),
    );
  }
}
