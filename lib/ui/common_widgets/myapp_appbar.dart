import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/my_color.dart';
import 'package:flutter_blog/data/provider/session_provider.dart';
import 'package:flutter_blog/ui/common_widgets/search_alert_dialog.dart';
import 'package:flutter_blog/ui/pages/cookieshop/payment_history/payment_history_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyappAppbar extends ConsumerWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SessionUser user = ref.read(sessionProvider);
    PaymentHistoryModel? model = ref.watch(paymentHistoryProvider);
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
                "내 쿠키 ${user.user!.cookie} >   ",
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
