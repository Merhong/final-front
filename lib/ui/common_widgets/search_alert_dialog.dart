import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/utils/validator_util.dart';
import 'package:flutter_blog/data/provider/param_provider.dart';
import 'package:flutter_blog/ui/pages/other/search_page/search_page.dart';
import 'package:flutter_blog/ui/pages/webtoon/list_page/webtoon_list_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../_core/constants/size.dart';

class SearchAlertDialog extends ConsumerStatefulWidget {
  const SearchAlertDialog({
    super.key,
  });

  @override
  _SearchAlertDialogState createState() => _SearchAlertDialogState();
}

class _SearchAlertDialogState extends ConsumerState<SearchAlertDialog> {
  final _formKey = GlobalKey<FormState>();
  final _commentText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Container(
        height: 20,
        child: Form(
          key: _formKey,
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
                    isDense: true,
                    contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  ),
                  obscureText: false,
                  // focusNode: focusNode,
                  // maxLength: 500,
                ),
              ),
              InkWell(
                child: Icon(Icons.search),
                // child: Text("등록", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.grey[600])),
                onTap: () {
                  if (_formKey.currentState!.validate() && _commentText.text.length >= 1) {
                    print("검색입력${_commentText.text}");
                    // ReplyReqDTO replyReqDTO = new ReplyReqDTO(text: _commentText.text);
                    // focusNode.unfocus();
                    // _commentText.clear();
                    ParamStore ps = ref.read(paramProvider);
                    ps.addSearchText(_commentText.text);
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => SearchPage()));
                  }
                },
              ),
            ],
          ),
        ),
      ),
      content: Container(
        height: sizeGetScreenHeight(context) * 0.5,
        // height: 5 + authorList.length * 70,
        child: Column(
          children: [
            Divider(color: Colors.grey, height: 1),
            Column(
              children: [
                // for (Author author in authorList)
                SizedBox(height: sizeM10),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        print("최근검색어선택");
                      },
                      child: Text("ㅎㅁ만ㅏ아ㄴㄹ", style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        print("최근검색어삭제ㅁㄴ");
                      },
                      child: Icon(Icons.close, size: 20, color: Colors.grey[600]),
                    ),
                    SizedBox(width: 3),
                  ],
                ),
                SizedBox(height: sizeS5),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
