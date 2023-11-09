import 'package:flutter/material.dart';

class UseCookieBar extends StatelessWidget {
  final String date;
  final String title;
  final String page;
  final String cookie;

  const UseCookieBar({
    Key? key,
    required this.date,
    required this.title,
    required this.page,
    required this.cookie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(13.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("$date", style: TextStyle(color: Colors.grey)),
              Text("$title"),
              Text("$page"),
              Row(
                children: [
                  Text("대여 ", style: TextStyle(color: Colors.grey)),
                  Text("$cookie", style: TextStyle(color: Colors.green)),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25.0),
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                '구매취소',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green),
                padding: MaterialStateProperty.all(EdgeInsets.all(12.0)),
                minimumSize: MaterialStateProperty.all(Size(80, 36)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
