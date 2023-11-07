// import 'package:dio/dio.dart';
// import 'package:flutter_blog/_core/constants/http.dart';
// import 'package:flutter_blog/data/dto/response_dto.dart';
// import 'package:flutter_blog/data/dto/webtoon_dto/rating_star_DTO.dart';
// import 'package:logger/logger.dart';
//
// class RatingStarRepository {
//   Future<ResponseDTO> fetchRatingStar(String jwt, RatingStarReqDTO ratingStarReqDTO, int episodeId) async {
//     print("${ratingStarReqDTO.score}스타");
//     print("${episodeId}episodeId");
//     try {
//       Response response = await dio.post("/episodes/star/${episodeId}?score=${ratingStarReqDTO.score}",
//           data: ratingStarReqDTO.toJson(), options: Options(headers: {"Authorization": "${jwt}"}));
//
//       ResponseDTO responseDTO = new ResponseDTO.fromJson(response.data);
//
//       RatingStarDTO ratingStarDTO = new RatingStarDTO.fromJson(responseDTO.data);
//
//       responseDTO.data = ratingStarDTO;
//
//       return responseDTO;
//     } catch (e) {
//       if (e is DioError) {
//         Logger().d("오류: ${e.response!.data}");
//         return new ResponseDTO.fromJson(e.response!.data);
//       }
//       print("실패!");
//       // return ResponseDTO(-1, "게시글 한건 불러오기 실패", null);
//       // return ResponseDTO(success: false, data: null, errorType: new ErrorType("13없음", 404));
//       return ResponseDTO(success: false, data: "실패");
//     }
//   }
// }
