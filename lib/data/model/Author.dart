import 'package:flutter_blog/data/model/user.dart';
import 'package:intl/intl.dart';

class Author {
  int id;
  String authorname;
  User? user;

  // 생성자는 선택적 매개변수에 required 하는게 편하다
  Author({
    required this.id,
    required this.authorname,
    this.user,
  });

  // 1. Dart 객체를 통신을 위한 Map 형태로 변환합니다.
  Map<String, dynamic> toJson() => {
        "id": id,
        "authorname": authorname,
        "user": user,
      };

  // 2. Map 형태로 받아서 Dart 객체로 변환합니다.
  // 이니셜라이저: 안쓰고 {} 안에 적으면 타이밍상 필드 초기화가 안됨
  // 이름이 있는 생성자
  Author.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        authorname = json["authorname"],
        user = json["user"];
  // created = DateFormat("yyyy-mm-dd").parse(json["created"]), // 3
  // updated = DateFormat("yyyy-mm-dd").parse(json["updated"]);
}
