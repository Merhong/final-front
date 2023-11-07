import 'package:flutter/material.dart';

class MyInterestAuthorDetailMiddleBar extends StatelessWidget {
  const MyInterestAuthorDetailMiddleBar({super.key});

  //각각이 Text여서 자기 크기만큼만 잡음 (=인라인)
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 240.0,
            child: OutlinedButton(
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("+"),
                  SizedBox(
                    width: 15,
                  ),
                  Text("관심"),
                  SizedBox(width: 15),
                  Text("25,471")
                ],
              ),
            ),
          ),
          Container(
            child: OutlinedButton(
                onPressed: () {}, child: Icon(Icons.share_rounded)),
          ),
          Container(
            child: OutlinedButton(
              onPressed: () {},
              child: Icon(Icons.report),
            ),
          )
        ],
      ),
    );
  }
}
