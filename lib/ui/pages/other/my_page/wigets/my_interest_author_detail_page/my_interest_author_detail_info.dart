import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/data/dto/user_dto/interest_author_detail_DTO.dart';
import 'package:flutter_blog/ui/pages/other/my_page/my_interest_author_detail_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyInterestAuthorDetailInfo extends StatelessWidget {
  InterestAuthorDetailDTO interestAuthorDetailDTO;

  MyInterestAuthorDetailInfo(this.interestAuthorDetailDTO);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 30.0,
                backgroundImage: NetworkImage("${imageURL}/AuthorPhoto/${interestAuthorDetailDTO.authorPhoto}"),
              ),
              SizedBox(
                width: 10,
              ),
              Text("${interestAuthorDetailDTO.authorNickname}"),
            ],
          ),
          SizedBox(height: 10),
          Text("${interestAuthorDetailDTO.introduce}")
        ],
      ),
    );
  }
}
