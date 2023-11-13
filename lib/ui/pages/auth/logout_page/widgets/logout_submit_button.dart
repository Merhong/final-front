import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/my_color.dart';
import 'package:flutter_blog/data/provider/session_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LogoutSubmitButton extends ConsumerWidget {
  final String text;
  final VoidCallback onPressed;

  LogoutSubmitButton({
    required this.text,
    required this.onPressed,
  });

  void _showAlertDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(
            child: Text(
              '로그아웃 합니다.',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          content: Container(
            height: 200,
            child: Column(
              children: [
                Text('${text}아이디가 로그아웃 됩니다.'),
                Text('더이상 로그인을 원치 않으시면 등록된'),
                Text('간편로그인을 삭제해주세요.'),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {}, icon: Icon(Icons.check_circle)),
                    Text("간편 로그인 ()삭제"),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {}, icon: Icon(Icons.check_circle)),
                    Text("모든 간편로그인 아이디 삭제"),
                  ],
                )
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                ref.read(sessionProvider).logout();
              },
              child: Text('확인'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 50,
      width: double.infinity,
      child: TextButton(
        child: Text(text, style: TextStyle(color: Colors.white)),
        style: TextButton.styleFrom(backgroundColor: CommonColors.green),
        onPressed: () {
          _showAlertDialog(context, ref);
        },
      ),
    );
  }
}
