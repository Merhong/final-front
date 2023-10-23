import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/data/dto/post_request.dart';
import 'package:flutter_blog/data/dto/response_dto.dart';
import 'package:flutter_blog/data/model/post.dart';
import 'package:flutter_blog/data/model/webtoon.dart';
import 'package:logger/logger.dart';

// MVVM패턴 : View -> Provider(전역프로바이더or뷰모델) -> Repository(통신+파싱을 책임)
// 나중에 싱글톤으로 바꿀것
class WebtoonRepository {
//
  Future<ResponseDTO> fetchPostList(String jwt) async {
    try {
      // 1. 통신
      Response response = await dio.get(
        "/webtoons",
        options: Options(headers: {"Authorization": "${jwt}"}),
      );

      // 2. ResponseDTO 파싱
      ResponseDTO responseDTO = new ResponseDTO.fromJson(response.data);

      // 3. ResponseDTO의 data 파싱
      List<dynamic> mapList = responseDTO.data as List<dynamic>;
      List<Post> postList = mapList.map((e) => Post.fromJson(e)).toList();

      // 4. 파싱한 데이터를 다시 공통 DTO에 덮어씌우기
      responseDTO.data = postList;

      return responseDTO;
    } catch (e) {
      // 200이 아니면 catch로 감
      return new ResponseDTO(success: false);
      // return new ResponseDTO(-1, "게시글 목록 불러오기 실패", null);
    }
  }

  Future<ResponseDTO> savePost(String jwt, PostSaveReqDTO dto) async {
    try {
      // 1. 통신
      Response response = await dio.post(
        "/post",
        data: dto.toJson(),
        options: Options(headers: {"Authorization": "${jwt}"}),
      );

      // 2. ResponseDTO 파싱
      ResponseDTO responseDTO = new ResponseDTO.fromJson(response.data);

      // 3. ResponseDTO의 data 파싱
      Post post = new Post.fromJson(responseDTO.data);

      // 4. 파싱한 데이터를 다시 공통 DTO에 덮어씌우기
      responseDTO.data = post;

      return responseDTO;
    } catch (e) {
      // 200이 아니면 catch로 감
      // return new ResponseDTO(-1, "게시글 작성 실패", null);
      return new ResponseDTO(success: false);
    }
  }

  Future<ResponseDTO> fetchWebtoon(String jwt, int id) async {
    try {
      // 통신
      Response response = await dio.get("/webtoons/$id",
          options: Options(headers: {
            "Authorization":
                "Bearer eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJtZXRhY29kaW5nLWtleSIsImlkIjoxLCJlbWFpbCI6InNzYXJAbmF0ZS5jb20iLCJleHAiOjE2OTgzODY3MTN9.bCIsMY0FRg4MFCH32s6UYexrTjcm23hPoN8A9-hJsok-a-zA_BYg7SldbOX_3y1JMMJkRFz5PZHFEI4bzqd53w"
          }));
      // 응답 받은 데이터 파싱
      ResponseDTO responseDTO = new ResponseDTO.fromJson(response.data);
      print("111111111responseDTO$responseDTO");

      responseDTO.data = Webtoon.fromDetailJson(responseDTO.data);
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

  Future<ResponseDTO> fetchWebtoonList(String jwt) async {
    try {
      // 통신

      Response response = await dio.get("/webtoons",
          options: Options(headers: {
            "Authorization":
                "Bearer eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJtZXRhY29kaW5nLWtleSIsImlkIjoxLCJlbWFpbCI6InNzYXJAbmF0ZS5jb20iLCJleHAiOjE2OTgzODY3MTN9.bCIsMY0FRg4MFCH32s6UYexrTjcm23hPoN8A9-hJsok-a-zA_BYg7SldbOX_3y1JMMJkRFz5PZHFEI4bzqd53w"
          }));
      // 응답 받은 데이터 파싱
      ResponseDTO responseDTO = new ResponseDTO.fromJson(response.data);

      List<dynamic> mapList = responseDTO.data as List<dynamic>;

      // Logger().d(responseDTO.data);
      List<Webtoon> webtoonList = mapList.map((webtoon) => Webtoon.fromHomeJson(webtoon)).toList();

      // Logger().d(webtoonList);

      responseDTO.data = webtoonList;

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

//
}
