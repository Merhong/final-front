import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/my_color.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Text(
        "NAVER",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: CommonColors.green,
        ),
      ),
    );
  }
}
