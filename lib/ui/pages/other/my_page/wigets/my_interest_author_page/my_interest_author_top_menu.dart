import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/pages/other/my_page/wigets/my_interest_author_page/my_interest_author_dropdown.dart';

import '../../../../../../_core/constants/size.dart';

class MyInterestAuthorTopMenu extends StatelessWidget {
  const MyInterestAuthorTopMenu({super.key, required this.allLength, this.isUpdateButton = false});

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
            Container(width: 80, child: MyInterestAuthorDropdown()),
            Spacer(),
            isUpdateButton == true ? Text("편집", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)) : SizedBox(),
          ],
        ),
      ),
    );
  }
}