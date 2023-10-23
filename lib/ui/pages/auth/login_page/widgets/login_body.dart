import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/common_widgets/custom_text_form_field.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          SizedBox(height: sizeM10),
          //size.dart const붙여서 사용 가능
          Text(
            "NAVER 로고 자리",
            style: TextStyle(fontSize: 30),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [Text("PC 키보드 보기"), Icon(Icons.toggle_on)],
          ),

          CustomTextFormWidget(
            text: "아이디",
            iconData: Icons.person,
          ),
          SizedBox(
            height: 10,
          ),
          CustomTextFormWidget(
            text: "비밀번호",
            iconData: Icons.lock,
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 50,
            child: TextButton(
              onPressed: () {},
              child: Text(
                "로그인",
                style: TextStyle(color: Colors.white),
              ),
              style: TextButton.styleFrom(
                backgroundColor: Colors.green,
              ),
            ),
          ),

          //로그클래스 받아온다 , "Login": String
        ],
      ),
    );
  }
}
