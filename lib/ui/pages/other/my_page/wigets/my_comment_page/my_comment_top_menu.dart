import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/pages/other/my_page/wigets/my_comment_page/my_comment_dropdown.dart';

import '../../../../../../_core/constants/size.dart';

class MyCommentTopMenu extends StatelessWidget {
  const MyCommentTopMenu({
    super.key,
    required this.allLength,
  });

  final int allLength;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(sizePaddingLR17, 0, sizePaddingLR17, 0),
      child: Row(
        children: [
          Text("웹툰 ${allLength}", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          SizedBox(width: sizeL20),
          Text("베스트도전 0", style: TextStyle(color: Colors.grey[500], fontWeight: FontWeight.bold)),
          SizedBox(width: sizeL20),
          // Text("최신 순", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          // Text("▼"),
          Container(width: 80, child: MyCommentDropdown()),
          Spacer(),
          InkWell(child: Icon(Icons.warning, size: 20, color: Colors.grey)),
        ],
      ),
    );
  }
}
