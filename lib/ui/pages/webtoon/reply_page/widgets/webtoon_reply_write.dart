import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/utils/validator_util.dart';
import 'package:flutter_blog/data/dto/reply_request.dart';
import 'package:flutter_blog/data/provider/session_provider.dart';
import 'package:flutter_blog/ui/pages/webtoon/reply_page/webtoon_reply_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../_core/constants/size.dart';

class WebtoonReplyWrite extends ConsumerStatefulWidget {
  WebtoonReplyWrite({
    Key? key,
  }) : super(key: key);

  @override
  _WebtoonReplyWriteState createState() => _WebtoonReplyWriteState();
}

class _WebtoonReplyWriteState extends ConsumerState<WebtoonReplyWrite> {
  final _formKey = GlobalKey<FormState>();
  final _commentText = TextEditingController();

  FocusNode focusNode = new FocusNode();

  @override
  void initState() {
    focusNode.addListener(() {
      // focusNode의 상태가 변할 때 화면을 다시 렌더링하게
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    SessionUser sessionUser = ref.read(sessionProvider);

    return Form(
      key: _formKey,
      child: Container(
        decoration: BoxDecoration(border: Border(top: BorderSide(color: Colors.grey))),
        height: focusNode.hasFocus ? 85 : 60,
        child: Stack(
          children: [
            focusNode.hasFocus
                ? Padding(
                    padding: EdgeInsets.fromLTRB(sizePaddingLR17, sizeS5, 0, 0),
                    child: Text("${sessionUser.user!.username}(${sessionUser.user!.email.split("@")[0]})",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  )
                : SizedBox(),
            Column(
              children: [
                focusNode.hasFocus ? SizedBox(height: sizeL20) : SizedBox(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(width: sizePaddingLR17),
                    Expanded(
                      child: TextFormField(
                        controller: _commentText,
                        validator: (value) {
                          return validateContent()(value); // String?을 입력으로 받아서 String?을 반환하는 함수를 적어야 함
                        },
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(borderSide: BorderSide.none),
                          hintStyle: TextStyle(fontSize: 15),
                          hintText: focusNode.hasFocus ? "주제와 무관한 내용 및 악플은 삭제될 수 있습니다." : "댓글을 입력해주세요.",
                          isDense: true,
                          contentPadding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                        ),
                        obscureText: false,
                        focusNode: focusNode,
                        maxLength: 500,
                      ),
                    ),
                    TextButton(
                      child: Text(
                        "등록",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[600],
                        ),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          print("댓글입력${_commentText.text}");
                          ReplyReqDTO replyReqDTO = new ReplyReqDTO(text: _commentText.text);
                          focusNode.unfocus();
                          _commentText.clear();
                          ref.read(webtoonReplyProvider.notifier).notifyCommentCreate(replyReqDTO);
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
