import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/common_widgets/custom_submit_button.dart';
import 'package:flutter_blog/ui/pages/auth/join_page/widgets/join_build_container1.dart';
import 'package:flutter_blog/ui/pages/auth/join_page/widgets/join_build_container2.dart';
import 'package:flutter_blog/ui/pages/auth/join_page/widgets/join_build_container3.dart';

class JoinForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _checkEmail = TextEditingController();
  final _username = TextEditingController();
  final _birthday = TextEditingController();
  final _gender = TextEditingController();
  final _tel = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: ListView(
          children: [
            SizedBox(height: sizeL20),
            //size.dart const붙여서 사용 가능
            JoinBuildContainer1(_email, _password, _checkEmail),
            SizedBox(height: sizeL20),
            JoinBuildContainer2(_username, _birthday, _gender, _tel),
            JoinBuildContainer3(),
            SizedBox(height: sizeL20),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Container(
                child: CustomSubmitButton(
                    text: "회원가입",
                    onPressed: () {
                      print(_email.text);
                      print(_password.text);
                      print(_checkEmail.text);
                      print("여기까지만 잘 불러짐");
                      print(_username.text);
                      print(_birthday.text);
                      print(_gender.text);
                      print(_tel.text);
                    }),
              ),
            ),
            //로그클래스 받아온다 , "Login": String
          ],
        ),
      ),
    );
  }
}
