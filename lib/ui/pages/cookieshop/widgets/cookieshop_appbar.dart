import 'package:flutter/material.dart';

AppBar cookieAppBar() {
  return AppBar(
    leading: Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        child: Icon(Icons.arrow_back_ios),
      ),
    ),
    leadingWidth: 15.0,
    title: Text("쿠키샵"),
  );
}
