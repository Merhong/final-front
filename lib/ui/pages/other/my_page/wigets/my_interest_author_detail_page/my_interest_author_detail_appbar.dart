import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyInterestAuthorDetailAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const MyInterestAuthorDetailAppBar({super.key});

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 1,
      backgroundColor: Colors.white,
      leading: Icon(
        CupertinoIcons.xmark,
        color: Colors.black,
      ),
    );
  }
}
