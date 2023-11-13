import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/my_color.dart';

import '../../_core/constants/size.dart';

class CommentBox extends StatelessWidget {
  CommentBox({
    required this.commentBoxRow,
    super.key,
  });

  Row commentBoxRow;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: sizeS5),
      height: sizeML20,
      decoration: BoxDecoration(
          border: Border.all(color: CommonColors.grey),
          borderRadius: BorderRadius.circular(3)),
      child: commentBoxRow,
    );
  }
}
