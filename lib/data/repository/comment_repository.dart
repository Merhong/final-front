import 'package:dio/dio.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/data/dto/comment_dto/comment_DTO.dart';
import 'package:flutter_blog/data/dto/comment_dto/re_comment_DTO.dart';
import 'package:flutter_blog/data/dto/reply_request.dart';
import 'package:flutter_blog/data/dto/response_dto.dart';
import 'package:flutter_blog/data/dto/webtoon_dto/comment_like_DTO.dart';
import 'package:flutter_blog/data/dto/webtoon_dto/re_comment_like_DTO.dart';
import 'package:flutter_blog/data/model/post.dart';
import 'package:logger/logger.dart';

class CommentRepository {
  Future<ResponseDTO> fetchCommentList(String jwt, episodeId) async {
    try {
      // 통신
      print("통신시작 episodeId : ${episodeId}");
      Response response = await dio.get("/comments/$episodeId", options: Options(headers: {"Authorization": "${jwt}"}));

      // 응답 받은 데이터 파싱
      ResponseDTO responseDTO = new ResponseDTO.fromJson(response.data);

      List<dynamic> mapList = responseDTO.data as List<dynamic>;
      List<CommentDTO> commentList = mapList.map((commentDTO) => CommentDTO.fromJson(commentDTO)).toList();
      print("테스트2");

      // Logger().d(webtoonList);

      responseDTO.data = commentList;

      return responseDTO;
    } catch (e) {
      if (e is DioError) {
        Logger().d("오류: ${e.response!.data}");
        return new ResponseDTO.fromJson(e.response!.data);
      }
      print("실패!");
      // return ResponseDTO(-1, "게시글 한건 불러오기 실패", null);
      // return ResponseDTO(success: false, data: null, errorType: new ErrorType("13없음", 404));
      return ResponseDTO(success: false);
    }
  }

  Future<ResponseDTO> fetchReCommentCreate(String jwt, ReplyReqDTO dto, int commentId) async {
    try {
      Response response = await dio.post("/recomments/$commentId", data: dto.toJson(), options: Options(headers: {"Authorization": "${jwt}"}));

      ResponseDTO responseDTO = new ResponseDTO.fromJson(response.data);

      ReCommentDTO reCommentDTO = new ReCommentDTO.fromJson(responseDTO.data);

      responseDTO.data = reCommentDTO;

      return responseDTO;
    } catch (e) {
      if (e is DioError) {
        Logger().d("오류: ${e.response!.data}");
        return new ResponseDTO.fromJson(e.response!.data);
      }
      print("실패!");
      // return ResponseDTO(-1, "게시글 한건 불러오기 실패", null);
      // return ResponseDTO(success: false, data: null, errorType: new ErrorType("13없음", 404));
      return ResponseDTO(success: false);
    }
  }

  Future<ResponseDTO> fetchReCommentLike(String jwt, int reCommentId) async {
    try {
      // 통신
      Response response = await dio.post("/recomments/like/$reCommentId", options: Options(headers: {"Authorization": "${jwt}"}));

      // 응답 받은 데이터 파싱
      ResponseDTO responseDTO = new ResponseDTO.fromJson(response.data);
      responseDTO.data = ReCommentLikeDTO.fromJson(responseDTO.data);

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

  Future<ResponseDTO> fetchReCommentDislike(String jwt, int reCommentId) async {
    try {
      // 통신
      Response response = await dio.post("/recomments/dislike/$reCommentId", options: Options(headers: {"Authorization": "${jwt}"}));

      // 응답 받은 데이터 파싱
      ResponseDTO responseDTO = new ResponseDTO.fromJson(response.data);
      responseDTO.data = ReCommentLikeDTO.fromJson(responseDTO.data);

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

  Future<ResponseDTO> fetchReCommentLikecancel(String jwt, int reCommentId) async {
    try {
      // 통신
      Response response = await dio.delete("/recomments/likecancel/$reCommentId", options: Options(headers: {"Authorization": "${jwt}"}));

      // 응답 받은 데이터 파싱
      ResponseDTO responseDTO = new ResponseDTO.fromJson(response.data);
      responseDTO.data = ReCommentLikeDTO.fromJson(responseDTO.data);

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

  Future<ResponseDTO> fetchCommentLike(String jwt, int commentId) async {
    try {
      // 통신
      Response response = await dio.post("/comments/like/$commentId", options: Options(headers: {"Authorization": "${jwt}"}));

      // 응답 받은 데이터 파싱
      ResponseDTO responseDTO = new ResponseDTO.fromJson(response.data);
      responseDTO.data = CommentLikeDTO.fromJson(responseDTO.data);

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

  Future<ResponseDTO> fetchCommentDislike(String jwt, int commentId) async {
    try {
      // 통신
      Response response = await dio.post("/comments/dislike/$commentId", options: Options(headers: {"Authorization": "${jwt}"}));

      // 응답 받은 데이터 파싱
      ResponseDTO responseDTO = new ResponseDTO.fromJson(response.data);
      responseDTO.data = CommentLikeDTO.fromJson(responseDTO.data);

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

  Future<ResponseDTO> fetchCommentLikecancel(String jwt, int commentId) async {
    try {
      // 통신
      Response response = await dio.delete("/comments/likecancel/$commentId", options: Options(headers: {"Authorization": "${jwt}"}));

      // 응답 받은 데이터 파싱
      ResponseDTO responseDTO = new ResponseDTO.fromJson(response.data);
      responseDTO.data = CommentLikeDTO.fromJson(responseDTO.data);

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

  Future<ResponseDTO> fetchCommentCreate(String jwt, ReplyReqDTO dto, int episodeId) async {
    try {
      Response response = await dio.post("/comments/$episodeId", data: dto.toJson(), options: Options(headers: {"Authorization": "${jwt}"}));

      ResponseDTO responseDTO = new ResponseDTO.fromJson(response.data);

      CommentDTO commentDTO = new CommentDTO.fromJson(responseDTO.data);

      responseDTO.data = commentDTO;

      return responseDTO;
    } catch (e) {
      if (e is DioError) {
        Logger().d("오류: ${e.response!.data}");
        return new ResponseDTO.fromJson(e.response!.data);
      }
      print("실패!");
      // return ResponseDTO(-1, "게시글 한건 불러오기 실패", null);
      // return ResponseDTO(success: false, data: null, errorType: new ErrorType("13없음", 404));
      return ResponseDTO(success: false);
    }
  }
}
