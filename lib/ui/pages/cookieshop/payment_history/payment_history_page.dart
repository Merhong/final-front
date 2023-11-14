import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/pages/cookieshop/payment_history/payment_history_view_model.dart';
import 'package:flutter_blog/ui/pages/cookieshop/widgets/history_list_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

class PurchaseHistory extends ConsumerWidget {
  const PurchaseHistory({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Logger().d("1번");
    ref.read(paymentHistoryProvider.notifier).notifyInit();

    PaymentHistoryModel? model = ref.watch(paymentHistoryProvider);

    return Padding(
      padding: const EdgeInsets.only(left: 13),
      child: ListView.builder(
          itemCount: model!.paymentHistoryDTOList.length,
          //여기 Row 컴포넌트로 빼야함
          itemBuilder: (context, index) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //변수로 변경해야함
                  historyList(
                      purchase: model!.paymentHistoryDTOList[index].createdAt),
                  historyList(
                      purchase: "구매",
                      amount:
                          model.paymentHistoryDTOList[index].purchasedCookie),
                  historyList(
                      purchase: "잔여",
                      amount:
                          model.paymentHistoryDTOList[index].nowCookieAmount),
                  historyList(
                      purchase: "금액",
                      amount: model.paymentHistoryDTOList[index].price),
                  Divider(),
                ],
              )),
    );
  }
}
