import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/my_color.dart';
import 'package:flutter_blog/ui/common_widgets/search_alert_dialog.dart';

class MyappAppbar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 1,
      backgroundColor: Colors.white, // 앱바 배경색을 흰색으로 설정
      title: Text(
        "MY",
        // 텍스트 스타일 설정
        style: TextStyle(
            color: Colors.black, // 텍스트 색상을 검은색으로 설정
            fontSize: 18,
            fontWeight: FontWeight.bold),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 17),
          child: Row(
            children: [
              Text(
                "내 쿠키 0 >   ",
                // 텍스트 스타일 설정
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: CommonColors.green,
                ),
              ),
              InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return SearchAlertDialog();
                      },
                    );
                  },
                  child: Icon(Icons.search, color: Colors.black)),
            ],
          ),
        ),
      ],
    );
  }
}
