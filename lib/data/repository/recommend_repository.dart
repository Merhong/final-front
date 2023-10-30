import 'package:dio/dio.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/data/dto/response_dto.dart';
import 'package:flutter_blog/data/dto/webtoon_dto/end_recommend_DTO.dart';

class RecommendRepository {
  Future<ResponseDTO> fetchRecommendList() async {
    try {
      Response response = await dio.get("/webtoons/recommend");
      ResponseDTO responseDTO = new ResponseDTO.fromJson(response.data);

      List<dynamic> mapList = responseDTO.data as List<dynamic>;

      List<EndRecommendationDTO> DTOList =
          mapList.map((e) => EndRecommendationDTO.fromJson(e)).toList();

      responseDTO.data = DTOList;
      return responseDTO;
    } catch (e) {
      return new ResponseDTO(
          success: false, data: "완결목록 불러오기 실패", errorType: null);
    }
  }
}
