import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/pages/cookieshop/widgets/history_list_item.dart';

class PurchaseHistory extends StatelessWidget {
  const PurchaseHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 13),
      child: ListView.builder(
          itemCount: 10,
          //여기 Row 컴포넌트로 빼야함
          itemBuilder: (context, index) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //변수로 변경해야함
                  historyList(purchase: "2023.3.20"),
                  historyList(purchase: "구매", amount: 10),
                  historyList(purchase: "잔여", amount: 0),
                  historyList(purchase: "금액", amount: 1200),
                  Divider(),
                ],
              )),
    );
  }
}
