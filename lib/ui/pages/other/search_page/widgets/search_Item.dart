import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/dto/webtoon_dto/search_webtoon_DTO.dart';
import 'package:flutter_blog/data/provider/param_provider.dart';
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
    return Padding(
      padding: EdgeInsets.symmetric(vertical: sizeM10, horizontal: sizePaddingLR17),
      child: InkWell(
        onTap: () {
          ParamStore ps = ref.read(paramProvider);
          ps.addWebtoonDetailId(searchDTO.id);
          ps.addBottomNavigationBarIndex(0);
          Navigator.push(context, MaterialPageRoute(builder: (_) => WebtoonDetailPage()));
        },
        child: Container(
          height: 100,
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.network(
                  // TODO 완결 무료 순위상승 g등 STACK으로
                  "${imageURL}/WebtoonThumbnail/${searchDTO.image}",
                  width: 90,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      "assets/default_webtoon_Thumbnail.jpg",
                      width: 90,
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
              Column(
                children: [
                  Text(searchDTO.title),
                  Text("${searchDTO.authorNicknameList!.toList().join('/').replaceAll(' ', '')} "),
                  Text("★ ${(searchDTO.starScore! / (searchDTO.starCount == 0 ? 1 : searchDTO.starCount!)).toStringAsFixed(2)}"),
                  SizedBox(height: 33),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
