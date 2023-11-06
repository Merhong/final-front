import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/dto/webtoon_dto/search_webtoon_DTO.dart';
import 'package:flutter_blog/data/provider/param_provider.dart';
import 'package:flutter_blog/ui/common_widgets/specially_tag.dart';
import 'package:flutter_blog/ui/pages/webtoon/detail_page/webtoon_detail_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchItem extends ConsumerWidget {
  const SearchItem({
    super.key,
    required this.searchDTO,
  });

  final SearchWebtoonDTO searchDTO;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: sizeM10, horizontal: sizePaddingLR17),
          child: InkWell(
            onTap: () {
              ParamStore ps = ref.read(paramProvider);
              ps.addWebtoonDetailId(searchDTO.id);
              ps.addBottomNavigationBarIndex(0);
              Navigator.push(context, MaterialPageRoute(builder: (_) => WebtoonDetailPage()));
            },
            child: Container(
              // height: 100,
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Stack(
                      children: [
                        Image.network(
                          "${imageURL}/WebtoonThumbnail/${searchDTO.image}",
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Image.asset(
                              "assets/default_webtoon_Thumbnail.jpg",
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                            );
                          },
                        ),
                        searchDTO.webtoonSpeciallyEnum == "신작"
                            ? SpeciallyTag(speciallyTagEnum: SpeciallyTagEnum.isNew)
                            : searchDTO.webtoonSpeciallyEnum == "무료"
                                ? SpeciallyTag(speciallyTagEnum: SpeciallyTagEnum.free)
                                : SizedBox()
                      ],
                    ),
                  ),
                  SizedBox(width: sizeM10),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${searchDTO.title}", style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(height: 2),
                      Text("${searchDTO.authorNicknameList!.toList().join('/').replaceAll(' ', '')} ",
                          style: TextStyle(color: Colors.grey[600], fontSize: 13)),
                      SizedBox(height: sizeS5),
                      Text("★ ${(searchDTO.starScore! / (searchDTO.starCount == 0 ? 1 : searchDTO.starCount!)).toStringAsFixed(2)}",
                          style: TextStyle(color: Colors.red, fontSize: 13)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Divider(color: Colors.grey, height: 1, thickness: 1),
      ],
    );
  }
}
