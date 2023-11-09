import 'package:dio/dio.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/data/dto/response_dto.dart';
import 'package:flutter_blog/data/dto/user_dto/interest_author_detail_DTO.dart';
import 'package:logger/logger.dart';

class AuthorDetailRepository {
  Future<ResponseDTO> fetchAuthorDetail(String jwt, int authorId) async {
    print("테스트${"/author/$authorId"}");
    try {
      // 통신
      Response response = await dio.get("/authors/$authorId", options: Options(headers: {"Authorization": "${jwt}"}));
      print("백엔드 통신 가닝????");

      // 응답 받은 데이터 파싱
      ResponseDTO responseDTO = new ResponseDTO.fromJson(response.data);
      print("fetchAuthorDetail통신1");
      // Logger().d("${responseDTO.data}");

      responseDTO.data = InterestAuthorDetailDTO.fromJson(responseDTO.data);
      print("fetchAuthorDetail통신2찍혀야함");

      return responseDTO;
    } catch (e) {
      if (e is DioError) {
        Logger().d("오류: ${e.response!.data}");
        return new ResponseDTO.fromJson(e.response!.data);
      }

      // return ResponseDTO(-1, "게시글 한건 불러오기 실패", null);
      // return ResponseDTO(success: false, data: null, errorType: new ErrorType("13없음", 404));
      return ResponseDTO(success: false);
    }
  }
}
