import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/pages/auth/join_page/widgets/join_build_container1.dart';
import 'package:flutter_blog/ui/pages/auth/join_page/widgets/join_build_container2.dart';
import 'package:flutter_blog/ui/pages/auth/join_page/widgets/join_build_container3.dart';
import 'package:flutter_blog/ui/pages/auth/join_page/widgets/join_submit_button.dart';

class JoinBody extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();

  JoinBody({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: ClampingScrollPhysics(),
      controller: _scrollController,
      child: Padding(
        padding: EdgeInsets.all(30.0),
        child: Column(
          children: [
            // 개인정보(이름, 비밀번호, 이메일)
            JoinBuildContainer1(),
            SizedBox(height: 16),
            Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8.0),
              ),
              // 인증(이름, 생년월일, 전화번호)
              child: JoinBuildContainer2(),
            ),
            SizedBox(height: 16),
            // 인증 약관 전체 동의 컨테이너 추가
            JoinBuildContainer3(),
            Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Container(
                  child: JoinSubmitButton(),
                ))
          ],
        ),
      ),
    );
  }
}

