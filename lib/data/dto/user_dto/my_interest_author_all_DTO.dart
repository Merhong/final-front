import 'package:flutter_blog/data/dto/user_dto/interest_author_DTO.dart';
import 'package:flutter_blog/data/dto/user_dto/recommend_author_DTO.dart';
import 'package:flutter_blog/data/model/author.dart';
import 'package:intl/intl.dart';

class MyInterestAuthorAllDTO {
  List<InterestAuthorDTO> interestAuthorDTOList;
  List<RecommendAuthorDTO> recommendAuthorDTOList;

  MyInterestAuthorAllDTO(this.interestAuthorDTOList, this.recommendAuthorDTOList);

  // Map 형태로 받아서 Dart 객체로 변환합니다.
  MyInterestAuthorAllDTO.fromJson(Map<String, dynamic> json)
      : interestAuthorDTOList =
            (json["interestAuthorDTOList"] as List).map((jsonInterestAuthorDTO) => InterestAuthorDTO.fromJson(jsonInterestAuthorDTO)).toList(),
        recommendAuthorDTOList =
            (json["recommendAuthorDTOList"] as List).map((jsonRecommendAuthorDTO) => RecommendAuthorDTO.fromJson(jsonRecommendAuthorDTO)).toList();

  @override
  String toString() {
    return 'MyInterestAuthorAllDTO{interestAuthorDTOList: $interestAuthorDTOList, recommendAuthorDTOList: $recommendAuthorDTOList}';
  }
}
