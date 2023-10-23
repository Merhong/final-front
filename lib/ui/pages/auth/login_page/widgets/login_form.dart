import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/move.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/_core/utils/validator_util.dart';
import 'package:flutter_blog/data/dto/user_request.dart';
import 'package:flutter_blog/data/provider/session_provider.dart';
import 'package:flutter_blog/ui/common_widgets/custom_auth_text_form_field.dart';
import 'package:flutter_blog/ui/common_widgets/custom_elavated_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginForm extends ConsumerWidget {
  // 컨슈머위젯으로
  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController(text: "ssar@nate.com");
  final _password = TextEditingController(text: "1234");
  // final _email = TextEditingController();
  // final _password = TextEditingController();

  LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // WidgetRef ref 추가
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomAuthTextFormField(
            text: "email",
            obscureText: false,
            funValidator: validateEmail(),
            controller: _email,
          ),
          const SizedBox(height: sizeM10),
          CustomAuthTextFormField(
            text: "Password",
            obscureText: true,
            funValidator: validatePassword(),
            controller: _password,
          ),
          const SizedBox(height: sizeXL50),
          CustomElevatedButton(
            text: "로그인",
            funPageRoute: () {
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
        ],
      ),
    );
  }
}
