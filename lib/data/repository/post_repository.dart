// import 'package:dio/dio.dart';
// import 'package:flutter_blog/_core/constants/http.dart';
// import 'package:flutter_blog/data/dto/post_request.dart';
// import 'package:flutter_blog/data/dto/response_dto.dart';
// import 'package:flutter_blog/data/model/post.dart';
// import 'package:logger/logger.dart';
//
// // MVVM패턴 : View -> Provider(전역프로바이더or뷰모델) -> Repository(통신+파싱을 책임)
// // 나중에 싱글톤으로 바꿀것
// class PostRepository {
// //
//   Future<ResponseDTO> fetchPostList(String jwt) async {
//     Logger().d("fetchPostList");
//     try {
//       // 1. 통신
//       Response response = await dio.get(
//         "/post",
//         options: Options(headers: {"Authorization": "${jwt}"}),
//       );
//
//       // 2. ResponseDTO 파싱
//       ResponseDTO responseDTO = new ResponseDTO.fromJson(response.data);
//
//       // 3. ResponseDTO의 data 파싱
//       List<dynamic> mapList = responseDTO.data as List<dynamic>;
//       List<Post> postList = mapList.map((e) => Post.fromJson(e)).toList();
//
//       // 4. 파싱한 데이터를 다시 공통 DTO에 덮어씌우기
//       responseDTO.data = postList;
//
//       return responseDTO;
//     } catch (e) {
//       // 200이 아니면 catch로 감
//       return new ResponseDTO(-1, "게시글 목록 불러오기 실패", null);
//     }
//   }
//
//   Future<ResponseDTO> savePost(String jwt, PostSaveReqDTO dto) async {
//     try {
//       // 1. 통신
//       Response response = await dio.post(
//         "/post",
//         data: dto.toJson(),
//         options: Options(headers: {"Authorization": "${jwt}"}),
//       );
//
//       Logger().d(response.data);
//
//       // 2. ResponseDTO 파싱
//       ResponseDTO responseDTO = new ResponseDTO.fromJson(response.data);
//
//       // 3. ResponseDTO의 data 파싱
//       Post post = new Post.fromJson(responseDTO.data);
//
//       // 4. 파싱한 데이터를 다시 공통 DTO에 덮어씌우기
//       responseDTO.data = post;
//
//       return responseDTO;
//     } catch (e) {
//       // 200이 아니면 catch로 감
//       return new ResponseDTO(-1, "게시글 작성 실패", null);
//     }
//   }
//
//   Future<ResponseDTO> fetchPost(String jwt, int id) async {
//     try {
//       // 통신
//       Response response = await dio.get("/post/$id", options: Options(headers: {"Authorization": "$jwt"}));
//
//       // 응답 받은 데이터 파싱
//       ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
//       responseDTO.data = Post.fromJson(responseDTO.data);
//
//       return responseDTO;
//     } catch (e) {
//       return ResponseDTO(-1, "게시글 한건 불러오기 실패", null);
//     }
//   }
//
// //
// }
