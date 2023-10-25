import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/size.dart';

class WebtoonReplyBody extends StatelessWidget {
  const WebtoonReplyBody({super.key});
//TODO: 대댓글 ExpansionTile 사용
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                Icons.circle,
                color: Colors.red,
              ),
              Text("댓글댓글댓글어쩌구저쩌구")
            ],
          ),
          SizedBox(
            height: sizeXL50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                child: Container(
                  height: sizeML20,
                  width: sizeXL50,
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.grey)),
                  child: Text("답글"),
                ),
              ),
              Row(
                children: [
                  InkWell(
                    child: Container(
                      height: sizeML20,
                      width: sizeXML80,
                      decoration:
                          BoxDecoration(border: Border.all(color: Colors.grey)),
                      child: Icon(Icons.thumb_up_outlined),
                    ),
                  ),
                  SizedBox(width: sizeM10),
                  InkWell(
                    child: Container(
                      height: sizeML20,
                      width: sizeXL50,
                      decoration:
                          BoxDecoration(border: Border.all(color: Colors.grey)),
                      child: Icon(Icons.thumb_down_outlined),
                    ),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
