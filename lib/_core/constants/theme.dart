import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
    primarySwatch: Colors.green,
    brightness: Brightness.light, // 앱의 기본 밝기 설정
    textTheme: TextTheme(
      bodyMedium: TextStyle(fontSize: 15), // 기본 텍스트
      bodySmall: TextStyle(fontSize: 8, color: Colors.grey, fontWeight: FontWeight.w400),
      displayLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
      displayMedium: TextStyle(fontWeight: FontWeight.w600, fontSize: 15, color: Colors.black),
    ),
    appBarTheme: AppBarTheme(),
  );
}

AppBarTheme appBarTheme() {
  return const AppBarTheme(
    titleTextStyle: TextStyle(color: Colors.black, fontSize: 20),
    centerTitle: true,
    backgroundColor: Colors.white,
    elevation: 0,
  );
}
