import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/my_color.dart';
import 'package:flutter_blog/ui/pages/cookieshop/payment_history/payment_history_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CurrentCookie extends ConsumerWidget {
  CurrentCookie();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    PaymentHistoryModel? model = ref.watch(paymentHistoryProvider);

    return Container(
      color: Colors.grey[300],
      child: Padding(
        padding: const EdgeInsets.all(13.0),
        child: Row(
          children: [
            Icon(
              Icons.cookie,
              color: Colors.orange,
            ),
            SizedBox(
              width: 5.0, // sizeS5 대신 고정 값 사용
            ),
            Text("현재 보유한 쿠키"),
            SizedBox(
              width: 5.0, // sizeS5 대신 고정 값 사용
            ),
            Text("${model!.cookieAmount}개",
                style: TextStyle(color: CommonColors.green)),
          ],
        ),
      ),
    );
  }
}
