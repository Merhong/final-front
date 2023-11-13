import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/dto/user_dto/interest_author_detail_DTO.dart';
import 'package:flutter_blog/ui/pages/other/author_page/my_interest_author_detail_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyInterestAuthorDetailInfo extends StatelessWidget {
  InterestAuthorDetailDTO interestAuthorDetailDTO;

  MyInterestAuthorDetailInfo(this.interestAuthorDetailDTO);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(sizePaddingLR17, 15, sizePaddingLR17, 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              InkWell(
                onTap: () {
                  // TODO 사진 크게보기
                },
                child: CircleAvatar(
                  radius: 45,
                  backgroundImage: NetworkImage("${imageURL}/AuthorPhoto/${interestAuthorDetailDTO.authorPhoto}"),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text("${interestAuthorDetailDTO.authorNickname} ✅", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            ],
          ),
          SizedBox(height: 10),
          // Text("${interestAuthorDetailDTO.introduce}"),
          Container(
              // constraints: BoxConstraints(minHeight: 40),
              child: Text("${interestAuthorDetailDTO.introduce}")),
        ],
      ),
    );
  }
}
