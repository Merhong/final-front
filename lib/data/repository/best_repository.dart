import 'package:dio/dio.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/data/dto/response_dto.dart';
import 'package:flutter_blog/data/dto/webtoon_dto/best_DTO.dart';
import 'package:logger/logger.dart';

class BestRepository {
  Future<ResponseDTO> fetchBestList(String jwt) async {
    try {
      // 통신
      Response response = await dio.get("/webtoons",
          options: Options(headers: {"Authorization": "${jwt}"}));

      // 응답 받은 데이터 파싱
      ResponseDTO responseDTO = new ResponseDTO.fromJson(response.data);
      // responseDTO.data = BestDTO.fromJson(responseDTO.data);

      List<dynamic> mapList = responseDTO.data as List<dynamic>;
      List<BestDTO> DTOList = mapList.map((e) => BestDTO.fromJson(e)).toList();

      responseDTO.data = DTOList;

      Logger().d(responseDTO.data);
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
