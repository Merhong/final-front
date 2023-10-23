import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/_core/constants/move.dart';
import 'package:flutter_blog/data/dto/response_dto.dart';
import 'package:flutter_blog/data/dto/user_request.dart';
import 'package:flutter_blog/data/model/user.dart';
import 'package:flutter_blog/data/repository/user_repository.dart';
import 'package:flutter_blog/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

// 1. 창고 데이터
class SessionUser {
  // 화면 context에 접근하는 법. 글로벌키
  final mContext = navigatorKey.currentContext;
  User? user;
  String? jwt;
  bool isLogin; // jwt가 있어도 시간 만료됐을수도 있으니까 필요함

  SessionUser({
    this.user,
    this.jwt,
    this.isLogin = false,
  });

  Future<void> join(JoinReqDTO joinReqDTO) async {
    // 1. 통신 코드
    ResponseDTO responseDTO = await UserRepository().fetchJoin(joinReqDTO);

    // 2. 비지니스 로직
    if (responseDTO.success == true) {
      Navigator.pushNamed(mContext!, Move.loginPage);
    } else {
      ScaffoldMessenger.of(mContext!).showSnackBar(SnackBar(content: Text(responseDTO.errorType!.message!)));
    }
  }

  Future<void> login(LoginReqDTO loginReqDTO) async {
    // 1. 통신 코드
    ResponseDTO responseDTO = await UserRepository().fetchLogin(loginReqDTO);

    // 2. 비지니스 로직
    if (responseDTO.success == true) {
      // 1. 세션값 갱신
      this.user = responseDTO.data as User;
      this.jwt = responseDTO.token;
      this.isLogin = true;

      // 2. 디바이스에 JWT 저장 (자동 로그인)
      await secureStorage.write(key: "jwt", value: responseDTO.token);

      // print("성공");
      // 3. 페이지 이동
      Navigator.pushNamed(mContext!, Move.homeListPage);
    } else {
      ScaffoldMessenger.of(mContext!).showSnackBar(SnackBar(content: Text("${responseDTO.errorType!.message!}")));
    }
  }

  // JWT는 로그아웃 할 때 서버로 요청할 필요가 없음.(어짜피 스테스리스로 서버에 정보가 없으니까)
  Future<void> logout() async {
    this.jwt = null;
    this.isLogin = false;
    this.user = null;

    await secureStorage.delete(key: "jwt");
    // await 없으면 삭제 전에 로그인페이지로 이동돼서 바로 다시 자동로그인 될 수 있음

    // Navigator.popAndPushNamed(context, Move.loginPage);
    Navigator.pushNamedAndRemoveUntil(mContext!, Move.loginPage, (route) => false);
    // 로그아웃이니까 스택 쌓인거 싹 다 없애기
  }
}

// 3. 창고 관리자
final sessionProvider = Provider<SessionUser>((ref) {
  return SessionUser();
});
