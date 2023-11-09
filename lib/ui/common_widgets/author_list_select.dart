import 'package:flutter/material.dart';

import '../../_core/constants/http.dart';
import '../../_core/constants/size.dart';
import '../../data/model/author.dart';

class AuthorListSelect extends StatelessWidget {
  const AuthorListSelect({
    super.key,
    required this.context,
    required this.webtoonTitle,
    required this.authorList,
    required this.inkWellChild,
  });

  final BuildContext context;
  final String webtoonTitle;
  final List<Author> authorList;
  final Widget inkWellChild;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: RichText(
                text: TextSpan(
                  text: "${webtoonTitle}",
                  style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
                  children: [
                    // TextSpan(text: " 의", style: TextStyle(color: Colors.grey[600], fontSize: 14)),
                    TextSpan(text: " 작가", style: TextStyle(color: Colors.green, fontSize: 16)),
                  ],
                ),
              ),
              content: Container(
                height: 5 + authorList.length * 70,
                child: Column(
                  children: [
                    for (Author author in authorList)
                      Column(
                        children: [
                          Divider(color: Colors.grey, height: 1, thickness: 1),
                          SizedBox(height: sizeS5),
                          InkWell(
                            onTap: () {
                              print("${author.authorPhoto}/${author.authorNickname}");
                              // TODO 작가페이지
                            },
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundImage: NetworkImage("${imageURL}/AuthorPhoto/${author.authorPhoto}"),
                                  radius: 30,
                                ),
                                SizedBox(width: sizeM10),
                                Text("${author.authorNickname}"),
                                Spacer(),
                                Text("> ", style: TextStyle(fontSize: 20, color: Colors.grey)),
                              ],
                            ),
                          ),
                          SizedBox(height: sizeS5),
                        ],
                      ),
                  ],
                ),
              ),
            );
          },
        );
      },
      child: inkWellChild,
    );
  }
}
