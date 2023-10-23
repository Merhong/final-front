import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/pages/auth/join_page/widgets/join_my_expansion_tile.dart';

class JoinBuildContainer3 extends StatelessWidget {
  const JoinBuildContainer3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: MyExpansionTile(
        title: "인증 약관 전체 동의",
        content: [
          Text("약관 내용 1"),
          Text("약관 내용 2"),
          Text("약관 내용 3"),
          Text("약관 내용 4"),
          Text("약관 내용 5"),
        ],
      ),
    );
  }
}
