import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/dto/user_dto/interest_author_detail_DTO.dart';
import 'package:flutter_blog/data/dto/user_dto/interest_author_detail_board_DTO.dart';

class MyInterestAuthorDetailBoard extends StatelessWidget {
  InterestAuthorDetailBoardDTO boardDTO;
  String authorName;
  String authorPhoto;

  MyInterestAuthorDetailBoard(this.boardDTO, this.authorName, this.authorPhoto);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(color: Colors.black26, height: 1, thickness: 1),
        Container(
          padding: EdgeInsets.fromLTRB(sizePaddingLR17, 10, sizePaddingLR17, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(radius: 25, backgroundImage: NetworkImage("${imageURL}/AuthorPhoto/${authorPhoto}")),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${authorName}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
                      Text("${boardDTO.createdAt.toString().split(" ")[0]}", style: TextStyle(color: Colors.grey[600], fontSize: 13)),
                    ],
                  ),
                  Spacer(),
                  Icon(Icons.more_vert, color: Colors.grey[700]),
                ],
              ),
              SizedBox(height: 10),
              Text("${boardDTO.title}", style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 5),
              Text("${boardDTO.text}"),
              SizedBox(height: 10),
              boardDTO.photo == null || boardDTO.photo!.isEmpty
                  ? SizedBox()
                  : InkWell(
                      onTap: () {
                        //TODO 사진 크게보기
                      },
                      child: Image.network("${imageURL}AuthorBoard/${boardDTO.photo}"),
                    ),
              SizedBox(height: 5),
            ],
          ),
        ),
      ],
    );
  }
}
