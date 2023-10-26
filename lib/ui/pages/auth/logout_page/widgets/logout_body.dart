import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/_core/utils/validator_util.dart';
import 'package:flutter_blog/ui/pages/auth/logout_page/widgets/logout_submit_button.dart';
import 'package:flutter_blog/ui/pages/auth/logout_page/widgets/logout_text_form_field.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LogoutBody extends ConsumerWidget {
  final _email = TextEditingController(text: "ssar@naver.com");
  final _password = TextEditingController(text: "1234");
  LogoutBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(sizePaddingLR17),
      child: ListView(
        children: [
          SizedBox(height: sizeL20),
          //size.dart const붙여서 사용 가능
          Text("Naver로고"),
          SizedBox(height: sizeL20),
          LogoutTextFormWidget(
            text: "daehong",
            iconData: Icons.check,
            sufixiconData: Icons.clear,
            obscureText: false,
            funValidator: validatePassword(),
            controller: _email,
          ),
          SizedBox(
            height: sizeL20,
          ),

          LogoutSubmitButton(
            text: "로그아웃",
            onPressed: () {},
          ),
          SizedBox(height: sizeXL50),

          Container(
              alignment: Alignment.topLeft,
              child: Text(
                "등록된 다른 간편 로그인 아이디로 로그인",
                style: TextStyle(color: Colors.black),
              )),
          LogoutTextFormWidget(
            text: "qw2938",
            iconData: Icons.check,
            sufixiconData: Icons.clear,
            obscureText: false,
            funValidator: validatePassword(),
            controller: _email,
          ),

          _buildTextButton(context),

          //로그클래스 받아온다 , "Login": String
        ],
      ),
    );
  }

  TextButton _buildTextButton(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.pushNamed(context, "/login");
      },
      child: Text("+다른 아이디로 로그인", textAlign: TextAlign.start),
    );
  }
}
