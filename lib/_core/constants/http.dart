import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const String serverURL = "http://192.168.0.45:8081";
// 통신용 백엔드 서버 주소 여기 적기
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
