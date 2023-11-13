import 'package:flutter/material.dart';

class HashTag extends StatelessWidget {
  String hashTagName;
  String hashTagEnum;

  HashTag({
    required this.hashTagName,
    required this.hashTagEnum,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (hashTagEnum == "장르") {
          // ParamStore ps = ref.read(paramProvider);
          // ps.addAAAAname(hashTagName);
          // Navigator.push(context, MaterialPageRoute(builder: (_) => aaaaPage()));
        }
      },
      child: Container(
        margin: EdgeInsets.all(3),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Color.fromRGBO(150, 150, 150, 0.5),
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(6, 3, 6, 3),
          child: Text("#${hashTagName}"),
        ),
      ),
    );
  }
}
