import 'package:intl/intl.dart';

class User {
  int id;
  String username;
  // String password;
  String email;
  DateTime created;
  DateTime updated;

  // 생성자는 선택적 매개변수에 required 하는게 편하다
  User({
    required this.id,
    required this.username,
    required this.email,
    required this.created,
    required this.updated,
  });

  // 1. Dart 객체를 통신을 위한 Map 형태로 변환합니다.
  Map<String, dynamic> toJson() => {"id": id, "username": username, "email": email, "created": created, "updated": updated};

  // 2. Map 형태로 받아서 Dart 객체로 변환합니다.
  // 이니셜라이저: 안쓰고 {} 안에 적으면 타이밍상 필드 초기화가 안됨
  // 이름이 있는 생성자
  User.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        username = json["username"],
        email = json["email"],
        created = DateFormat("yyyy-mm-dd").parse(json["created"]), // 3
        updated = DateFormat("yyyy-mm-dd").parse(json["updated"]);
}
