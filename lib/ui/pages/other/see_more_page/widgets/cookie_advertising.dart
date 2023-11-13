import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/size.dart';

class CookieAdvertising extends StatelessWidget {
  const CookieAdvertising({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
            left: sizePaddingLR17, right: sizePaddingLR17),
        child: Container(
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(6)),
            child: Container(
              height: 90,
              child: Image.asset(
                "assets/ad.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
