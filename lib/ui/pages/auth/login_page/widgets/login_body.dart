import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/pages/auth/login_page/widgets/login_form.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginBody extends ConsumerWidget {
  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController(text: "ssar@naver.com");
  final _password = TextEditingController(text: "1234");

  LoginBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(sizePaddingLR17),
      child: Form(
        key: _formKey,
        child: ListView(
          children: [
            SizedBox(height: sizeL20),
            //size.dart const붙여서 사용 가능
            Container(
                child: Text(
                  "Naver로고",
                  style: TextStyle(fontSize: 30, color: Color(0xFF03C705B)),
                ),
                alignment: Alignment.center),
            SizedBox(height: sizeL20),
            LoginForm(),
            SizedBox(height: sizeL20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildTextButtonFindId(context),
                _buildTextButtonPassword(context),
                _buildTextButtonJoin(context),
              ],
            ),

            //로그클래스 받아온다 , "Login": String
          ],
        ),
      ),
    );
  }

  // TODO : 아이디 찾기 페이지 제작 및 연결
  TextButton _buildTextButtonFindId(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.pushNamed(context, "/join");
      },
      child: Text("아이디 찾기"),
    );
  }

  // TODO : 비밀번호 찾기 페이지 제작 및 연결
  TextButton _buildTextButtonPassword(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.pushNamed(context, "/join");
      },
      child: Text("비밀번호 찾기"),
    );
  }

  TextButton _buildTextButtonJoin(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.pushNamed(context, "/join");
      },
      child: Text("회원가입"),
    );
  }
}
