import 'package:flutter/material.dart';

class RatingStarAlert extends StatefulWidget {
  const RatingStarAlert({
    Key? key,
  }) : super(key: key);

  @override
  _RatingStarAlertState createState() => _RatingStarAlertState();
}

class _RatingStarAlertState extends State<RatingStarAlert> {
  bool isStarRated = false; // 별 아이콘의 클릭 상태

  void toggleStarRating() {
    setState(() {
      isStarRated = !isStarRated;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            List<bool> isStarRatedList = [false, false, false, false, false];
            return StatefulBuilder(builder: (context, setStateInDialog) {
              return AlertDialog(
                title: Text("별점주기"),
                content: Row(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.star),
                          iconSize: 36.0,
                          color:
                              isStarRatedList[0] ? Colors.yellow : Colors.grey,
                          onPressed: () {
                            setStateInDialog(() {
                              isStarRatedList[0] = !isStarRatedList[0];
                            });
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.star),
                          iconSize: 36.0,
                          color:
                              isStarRatedList[1] ? Colors.yellow : Colors.grey,
                          onPressed: () {
                            setStateInDialog(() {
                              isStarRatedList[1] = !isStarRatedList[1];
                            });
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.star),
                          iconSize: 36.0,
                          color:
                              isStarRatedList[2] ? Colors.yellow : Colors.grey,
                          onPressed: () {
                            setStateInDialog(() {
                              isStarRatedList[2] = !isStarRatedList[2];
                            });
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.star),
                          iconSize: 36.0,
                          color:
                              isStarRatedList[3] ? Colors.yellow : Colors.grey,
                          onPressed: () {
                            setStateInDialog(() {
                              isStarRatedList[3] = !isStarRatedList[3];
                            });
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.star),
                          iconSize: 36.0,
                          color:
                              isStarRatedList[4] ? Colors.yellow : Colors.grey,
                          onPressed: () {
                            setStateInDialog(() {
                              isStarRatedList[4] = !isStarRatedList[4];
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                actions: <Widget>[
                  ElevatedButton(
                    child: Text("취소"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  ElevatedButton(
                    child: Text("확인"),
                    onPressed: () {
                      // 여기에서 각 별점을 처리하거나 다른 작업을 수행할 수 있습니다.
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            });
          },
        );
      },
      child: Container(
        decoration: BoxDecoration(border: Border.all()),
        child: Padding(
          padding: EdgeInsets.all(2),
          child: Row(
            children: <Widget>[
              Icon(
                Icons.star,
                color: Colors.yellow,
                size: 20.0,
              ),
              Text("별점주기"),
            ],
          ),
        ),
      ),
    );
  }
}
