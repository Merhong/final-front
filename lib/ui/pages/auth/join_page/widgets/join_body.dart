import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/common_widgets/custom_submit_button.dart';
import 'package:flutter_blog/ui/pages/auth/join_page/widgets/join_form_container_top.dart';
import 'package:flutter_blog/ui/pages/auth/join_page/widgets/join_form_container_middle.dart';
import 'package:flutter_blog/ui/pages/auth/join_page/widgets/join_form_container_bottom.dart';

class JoinBody extends StatelessWidget {
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
      padding: const EdgeInsets.all(sizePaddingLR17),
      child: Form(
        key: _formKey,
        child: ListView(
          children: [
            SizedBox(height: sizeL20),
            //size.dart const붙여서 사용 가능
            JoinFormContainerTop(_email, _password, _checkEmail),
            SizedBox(height: sizeL20),
            JoinFormContainerMiddle(_username, _birthday, _gender, _tel),
            JoinBuildContainerBottom(),
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
