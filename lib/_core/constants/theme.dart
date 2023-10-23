import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: Colors.white,
      titleTextStyle: TextStyle(color: Colors.black),
      iconTheme: IconThemeData(color: Colors.black),
    ),
  );
}

AppBarTheme appBarTheme() {
  return const AppBarTheme(
    titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
    centerTitle: true,
    backgroundColor: Colors.black12,
    elevation: 0,
  );
}
