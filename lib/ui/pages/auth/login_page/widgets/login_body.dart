import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/dto/user_request.dart';
import 'package:flutter_blog/data/provider/session_provider.dart';
import 'package:flutter_blog/ui/common_widgets/custom_submit_button.dart';
import 'package:flutter_blog/ui/common_widgets/custom_text_button.dart';
import 'package:flutter_blog/ui/common_widgets/custom_text_form_field.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../_core/utils/validator_util.dart';

class LoginBody extends ConsumerWidget {
  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController(text: "ssar@nate.com");
  final _password = TextEditingController(text: "1234");

  LoginBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
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
              obscureText: false,
              funValidator: validateEmail(),
              controller: _email,
            ),
            SizedBox(
              height: 10,
            ),
            CustomTextFormWidget(
              text: "비밀번호",
              iconData: Icons.lock,
              obscureText: true,
              funValidator: validatePassword(),
              controller: _password,
            ),
            SizedBox(
              height: 10,
            ),

            CustomSubmitButton(
              text: "로그인",
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  LoginReqDTO loginReqDTO = LoginReqDTO(
                    email: _email.text,
                    password: _password.text,
                  );
                  print(_email.text);
                  print(_password.text);
                  SessionUser user = ref.read(sessionProvider);
                  user.login(loginReqDTO);
                }
              },
            ),
            SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "/join");
              },
              child: Text("회원가입페이지로 이동"),
            ),

            //로그클래스 받아온다 , "Login": String
          ],
        ),
      ),
    );
  }
}
