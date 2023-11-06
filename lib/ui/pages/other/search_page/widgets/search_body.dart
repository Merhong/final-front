import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/dto/comment_dto/comment_DTO.dart';
import 'package:flutter_blog/data/dto/webtoon_dto/search_webtoon_DTO.dart';
import 'package:flutter_blog/data/provider/param_provider.dart';
import 'package:flutter_blog/data/provider/session_provider.dart';
import 'package:flutter_blog/ui/common_widgets/comment_box.dart';
import 'package:flutter_blog/ui/common_widgets/my_stackbar.dart';
import 'package:flutter_blog/ui/common_widgets/title_tag.dart';
import 'package:flutter_blog/ui/pages/other/search_page/widgets/search_Item.dart';
import 'package:flutter_blog/ui/pages/other/search_page/widgets/search_searchbar.dart';
import 'package:flutter_blog/ui/pages/webtoon/re_reply_page/webtoon_re_reply_page.dart';
import 'package:flutter_blog/ui/pages/webtoon/reply_page/webtoon_reply_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class SearchBody extends StatelessWidget {
  SearchBody(this.searchDTOList);

  List<SearchWebtoonDTO> searchDTOList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchSearchbar(),
        Expanded(
          child: GestureDetector(
            onTap: () {
              print("제스처작동 키보드내리기");
              FocusScope.of(context).unfocus();
            },
            child: ListView.builder(
              itemCount: searchDTOList.length + 1,
              itemBuilder: (context, index) {
                return index == 0
                    ? Padding(
                        padding: EdgeInsets.fromLTRB(sizePaddingLR17, sizeM10, 0, 0),
                        child: Text("웹툰 ${searchDTOList.length}", style: TextStyle(fontWeight: FontWeight.bold)),
                      )
                    : SearchItem(searchDTO: searchDTOList[index - 1]);
              },
            ),
          ),
        ),
      ],
    );
  }
}
