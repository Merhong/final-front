import 'package:flutter/material.dart';

enum TitleTagEnum { up, end, stop, author, admin, best, reReply }

class TitleTag extends StatelessWidget {
  TitleTagEnum titleTagEnum;

  TitleTag({required this.titleTagEnum});

  @override
  Widget build(BuildContext context) {
    return titleTagEnum == TitleTagEnum.up
        ? Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.red),
              borderRadius: BorderRadius.circular(3),
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(3, 0, 2, 0),
              child: Text("up", style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.red)),
            ),
          )
        : titleTagEnum == TitleTagEnum.end
            ? Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.circular(3),
                ),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(1, 0, 1, 0),
                  child: Text("완결", style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold, color: Colors.blue)),
                ),
              )
            : titleTagEnum == TitleTagEnum.stop
                ? Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(3),
                    ),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(1, 0, 1, 0),
                      child: Text("휴재", style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold, color: Colors.grey[600])),
                    ),
                  )
                : titleTagEnum == TitleTagEnum.author
                    ? Container(
                        decoration: BoxDecoration(
                          color: Colors.green,
                          border: Border.all(color: Colors.green),
                          borderRadius: BorderRadius.circular(3),
                        ),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(1, 0, 1, 0),
                          child: Text("작가", style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold, color: Colors.white)),
                        ),
                      )
                    : titleTagEnum == TitleTagEnum.admin
                        ? Container(
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              border: Border.all(color: Colors.blue),
                              borderRadius: BorderRadius.circular(3),
                            ),
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(1, 0, 1, 0),
                              child: Text("관리자", style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold, color: Colors.white)),
                            ),
                          )
                        : titleTagEnum == TitleTagEnum.reReply
                            ? Container(
                                decoration: BoxDecoration(
                                  // color: Colors.grey,
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(3),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(1, 0, 1, 0),
                                  child: Text("답글", style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold, color: Colors.grey[600])),
                                ),
                              )
                            : Container(
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  border: Border.all(color: Colors.red),
                                  borderRadius: BorderRadius.circular(3),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(1, 0, 1, 0),
                                  child: Text("BEST", style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold, color: Colors.white)),
                                ),
                              );
  }
}
