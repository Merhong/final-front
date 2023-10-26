import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/pages/webtoon/detail_page/webtoon_detail_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class WebtoonDetailThumbnail extends ConsumerWidget {
  final String image;
  final int interestCount;

  const WebtoonDetailThumbnail({
    required this.image,
    required this.interestCount,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        Container(color: Colors.blue, height: 60),
        buildThumbnail(context),
        buildInteresting(context, ref),
      ],
    );
  }

  Positioned buildInteresting(BuildContext context, WidgetRef ref) {
    return Positioned(
      child: SizedBox(
        height: 175,
        child: Align(
          alignment: Alignment(0, 1),
          child: InkWell(
            onTap: () {
              print("관심클릭");
              ref.read(webtoonDetailProvider.notifier).notifyInterest();
            },
            child: Container(
              height: 25,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: sizeS5),
                child:
                    Text("+ 관심 ${NumberFormat('#,###').format(interestCount)}", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
              ),
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
            child: Image.network('${image}', fit: BoxFit.cover, height: 190, width: sizeGetScreenWidth(context) * 0.85)),
      ),
    );
  }
}
