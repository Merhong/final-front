import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// http 통신
final dio = Dio(
  BaseOptions(
    baseUrl: "http://192.168.0.50:8080", // 내 IP 입력 // 학원
    // baseUrl: "http://172.30.1.18:8081", // 내 IP 입력 // 집
    contentType: "application/json; charset=utf-8",
  ),
);

// 휴대폰 로컬에 파일로 저장
const secureStorage = FlutterSecureStorage();
// 유효하면 자동 로그인 할 예정
