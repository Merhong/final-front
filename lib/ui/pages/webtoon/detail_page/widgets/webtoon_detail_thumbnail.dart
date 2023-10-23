import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:intl/intl.dart';

class WebtoonDetailThumbnail extends StatelessWidget {
  final String image;
  final int likeCount;

  const WebtoonDetailThumbnail({
    required this.image,
    required this.likeCount,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(color: Colors.blue, height: 60),
        buildThumbnail(context),
        buildInteresting(context),
      ],
    );
  }

  Positioned buildInteresting(BuildContext context) {
    return Positioned(
      child: SizedBox(
        height: 175,
        child: Align(
          alignment: Alignment(0, 1),
          child: Container(
            height: 25,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: sizeS5),
              child: Text("+ 관심 ${NumberFormat('#,###').format(likeCount)}", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildThumbnail(BuildContext context) {
    return Positioned(
      child: Center(
        child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset('${image}', fit: BoxFit.cover, height: 190, width: sizeGetScreenWidth(context) * 0.85)),
      ),
    );
  }
}
