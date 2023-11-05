import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// ↓↓↓↓ 통신용 백엔드 서버 주소 여기 적기 ↓↓↓↓
// const String serverURL = "http://172.30.1.18:8081"; // 김지원 집
const String serverURL = "http://192.168.0.45:8081"; // 김지원
// const String serverURL = "http://192.168.0.44:8081"; // 김하얀
// const String serverURL = "http://192.168.0.48:8081"; // 박민희
// const String serverURL = "http://192.168.0.49:8081"; // 윤혜림
// const String serverURL = "http://192.168.0.50:8081"; // 김대홍
///////////////////////////////////////////////////////////////

const String imageURL = "${serverURL}/image?route=";

// http 통신
final dio = Dio(
  BaseOptions(
    baseUrl: serverURL, // 서버 주소 위에 적어주세요
    contentType: "application/json; charset=utf-8",
  ),
);

// 휴대폰 로컬에 파일로 저장
const secureStorage = FlutterSecureStorage();
// 유효하면 자동 로그인 할 예정
