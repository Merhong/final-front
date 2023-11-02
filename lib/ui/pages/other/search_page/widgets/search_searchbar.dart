import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/provider/param_provider.dart';
import 'package:flutter_blog/ui/pages/other/search_page/search_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchSearchbar extends ConsumerStatefulWidget {
  const SearchSearchbar({
    super.key,
  });

  @override
  _SearchSearchbarState createState() => _SearchSearchbarState();
}

class _SearchSearchbarState extends ConsumerState<SearchSearchbar> {
  final _formKey = GlobalKey<FormState>();
  final _commentText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _commentText.text = ref.read(paramProvider).searchText!;

    return Container(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: sizePaddingLR17, vertical: 3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _commentText,
                      // validator: (value) {
                      //   return validateContent()(value); // String?을 입력으로 받아서 String?을 반환하는 함수를 적어야 함
                      // },
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(borderSide: BorderSide.none),
                        hintStyle: TextStyle(fontSize: 15),
                        // hintText: focusNode.hasFocus ? "주제와 무관한 내용 및 악플은 삭제될 수 있습니다." : "댓글을 입력해주세요.",
                        hintText: "제목 또는 작가명 검색",
                        isDense: false,
                        contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      ),
                      obscureText: false,
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      // focusNode: focusNode,
                      // maxLength: 500,
                    ),
                  ),
                  InkWell(
                    child: Icon(Icons.search, size: 30),
                    // child: Text("등록", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.grey[600])),
                    onTap: () {
                      if (_formKey.currentState!.validate() && _commentText.text.length >= 1) {
                        print("검색입력${_commentText.text}");
                        // ReplyReqDTO replyReqDTO = new ReplyReqDTO(text: _commentText.text);
                        // focusNode.unfocus();
                        // _commentText.clear();
                        ParamStore ps = ref.read(paramProvider);
                        //
                        ps.addSearchText(_commentText.text);
                        ps.isSearchMove = true;
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => SearchPage()));
                      }
                    },
                  ),
                ],
              ),
            ),
            Divider(height: 1, color: Colors.grey),
            Container(
              padding: EdgeInsets.symmetric(vertical: sizeS5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("전체", style: TextStyle(color: Colors.green)),
                  Text("웹툰", style: TextStyle(color: Colors.grey[600])),
                  Text("베스트도전", style: TextStyle(color: Colors.grey[600])),
                ],
              ),
            ),
            Divider(height: 1, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
