import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/pages/other/my_page/wigets/my_recent_page/my_recent_dropdown.dart';

import '../../../../../../_core/constants/size.dart';

class MyRecentTopMenu extends StatelessWidget {
  const MyRecentTopMenu({super.key, required this.allLength, this.isUpdateButton = false});

  final int allLength;
  final bool isUpdateButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.fromLTRB(sizePaddingLR17, 0, sizePaddingLR17, 0),
        child: Row(
          children: [
            Text("전체 ${allLength}", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
            SizedBox(width: sizeL20),
            // Text("업데이트 순", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
            // Text("▼"),
            Container(width: 80, child: MyRecentDropdown()),
            Spacer(),
            isUpdateButton == true ? Text("편집", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)) : SizedBox(),
          ],
        ),
      ),
    );
  }
}
