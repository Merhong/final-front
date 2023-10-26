import 'package:flutter/material.dart';

class CustomBottomTitleAppbar extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;

  CustomBottomTitleAppbar(this.title);

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Row(
        children: [
          Text(
            "$title",
            style:
                TextStyle(fontSize: 15, fontWeight: FontWeight.bold // 텍스트 크기 조절
                    // 다른 스타일 설정도 가능
                    ),
          ),
          // 다른 위젯 추가 가능
        ],
      ),
      actions: [Icon(Icons.search)],
    );
  }
}
