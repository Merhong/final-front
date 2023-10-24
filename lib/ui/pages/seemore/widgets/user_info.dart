import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/size.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: sizeM10),
            Text(
              "khy9857님",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: sizeS5),
            InkWell(
              child: Text("로그인계정설정 >",
                  style: TextStyle(fontSize: 10, color: Colors.grey)),
            )
          ],
        ),
      ),
    );
  }
}
