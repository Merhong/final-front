import 'package:dio/dio.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/data/dto/response_dto.dart';
import 'package:flutter_blog/data/model/user.dart';
import 'package:logger/logger.dart';

import '../dto/user_request.dart';

// MVVM패턴 : View -> Provider(전역프로바이더or뷰모델) -> Repository(통신+파싱을 책임)
// 나중에 싱글톤으로 바꿀것
class UserRepository {
//
  Future<ResponseDTO> fetchJoin(JoinReqDTO requestDTO) async {
    try {
      Response response = await dio.post("/join", data: requestDTO.toJson()); // await dio.http메서드타입("주소", data: 보낼객체.toJson());
      ResponseDTO responseDTO = new ResponseDTO.fromJson(response.data);

      // Map타입을 유저타입으로 바꿔주기 (그래도 타입은 dynamic이니까 사용할때 as User 붙여서)
      // 필요할때만 쓰면 됨
      // responseDTO.data = User.fromJson(responseDTO.data);

      return responseDTO;
    } catch (e) {
      // 200이 아니면 catch로 감
      return new ResponseDTO(
        success: false,
        errorType: ErrorType(message: "가입실패"),
      );
    }
  }

//

  Future<ResponseDTO> fetchLogin(LoginReqDTO requestDTO) async {
    try {
      // 1. 통신
      Response response = await dio.post("/login", data: requestDTO.toJson());

      // 2. DTO 파싱
      ResponseDTO responseDTO = new ResponseDTO.fromJson(response.data);

      responseDTO.data = new User.fromJson(responseDTO.data);
      // Logger().d(responseDTO);

      // 3. 토큰 받기
      List<String>? jwt = response.headers["Authorization"];

      if (jwt != null) {
        responseDTO.token = jwt.first; // jwt[0]과 같음
      }

      // 필요할때만 쓰기
      // responseDTO.data = User.fromJson(responseDTO.data);

      return responseDTO;
    } catch (e) {
      // 200이 아니면 catch로 감

      // Logger().d("캐치로옴");
      return new ResponseDTO(
        success: false,
        errorType: ErrorType(message: "로그인실패"),
      );
    }
  }
//
}
