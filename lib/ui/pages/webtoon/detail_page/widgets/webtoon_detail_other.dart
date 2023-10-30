import 'package:flutter/material.dart';
import 'package:flutter_blog/data/provider/param_provider.dart';
import 'package:flutter_blog/ui/common_widgets/webtoon_list_item.dart';
import 'package:flutter_blog/ui/pages/webtoon/detail_page/webtoon_detail_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../_core/constants/size.dart';
import '../../../../../data/dto/webtoon_DTO/detail_page_webtoon_DTO.dart';
import '../../../../common_widgets/bottom_rule.dart';

class WebtoonDetailOther extends ConsumerWidget {
  const WebtoonDetailOther({
    super.key,
    required this.webtoonDTO,
  });

  final DetailPageWebtoonDTO webtoonDTO;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(color: Colors.grey, height: 1),
        webtoonDTO.authorOtherWebtoonList!.length != 0 ? buildAutherOtherWebtoon(ref) : SizedBox(),
        SizedBox(height: sizeM10),
        BottomRule(),
      ],
    );
  }

  Column buildAutherOtherWebtoon(WidgetRef ref) {
    return Column(
      children: [
        SizedBox(height: sizeS5),
        Padding(
          padding: EdgeInsets.fromLTRB(sizePaddingLR17, sizeM10, sizePaddingLR17, sizeM10),
          child: Row(
            children: [
              Text(
                "${webtoonDTO.authorList.map((author) => author.authorNickname).toList().join('/').replaceAll(' ', '')}",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(" 님의 다른 작품", style: TextStyle(fontSize: 12)),
            ],
          ),
        ),
        Container(
          height: 200,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12), // sizePaddingLR17인데 아이템 마진만큼 빼야해서
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: webtoonDTO.authorOtherWebtoonList!.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: sizeS5),
                  width: sizeGetScreenWidth(context) * 0.315,
                  child: InkWell(
                    onTap: () {
                      ParamStore ps = ref.read(paramProvider);
                      ps.isWebtoonDetailMove = true;
                      ps.addWebtoonDetailId(webtoonDTO.authorOtherWebtoonList![index].id);
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => WebtoonDetailPage()));
                    },
                    child: WebtoonListItem(webtoonDTO: webtoonDTO.authorOtherWebtoonList![index]),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
