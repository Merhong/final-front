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
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: ListView(
          children: [
            SizedBox(height: sizeL20),
            //size.dart const붙여서 사용 가능
            Text("Naver로고"),
            SizedBox(height: sizeL20),
            LoginForm(),
            SizedBox(height: sizeL20),
            _buildTextButton(context),

            //로그클래스 받아온다 , "Login": String
          ],
        ),
      ),
    );
  }

  TextButton _buildTextButton(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.pushNamed(context, "/join");
      },
      child: Text("회원가입페이지로 이동"),
    );
  }
}
