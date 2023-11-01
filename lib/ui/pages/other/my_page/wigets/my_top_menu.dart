import 'package:flutter/material.dart';

import '../../../../../_core/constants/size.dart';

class MyTopMenu extends StatelessWidget {
  const MyTopMenu({super.key, required this.allLength, this.isUpdateButton = false});

  final int allLength;
  final bool isUpdateButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.fromLTRB(sizePaddingLR17, sizeM10, sizePaddingLR17, sizeM10),
        child: Row(
          children: [
            Text("전체 ${allLength}", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
            SizedBox(width: sizeL20),
            Text("업데이트 순", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
            Text("▼"),
            Spacer(),
            isUpdateButton == true ? Text("편집", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)) : SizedBox(),
          ],
        ),
      ),
    );
  }
}
