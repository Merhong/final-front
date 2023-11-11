import 'package:flutter/material.dart';

class MyInterestAuthorDetailAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyInterestAuthorDetailAppBar({super.key});

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.close,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
            // 버튼 클릭 시 실행할 동작
          },
        ));
  }
}
