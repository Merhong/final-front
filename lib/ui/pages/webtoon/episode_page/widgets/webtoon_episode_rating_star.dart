import 'package:flutter/material.dart';

class RatingStarAlert extends StatefulWidget {
  const RatingStarAlert({
    Key? key,
  }) : super(key: key);

  @override
  _RatingStarAlertState createState() => _RatingStarAlertState();
}

class _RatingStarAlertState extends State<RatingStarAlert> {
  int numberOfStars = 0; // 클릭된 별의 수

  void setNumberOfStars(int num) {
    setState(() {
      numberOfStars = num;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return StatefulBuilder(builder: (context, setStateInDialog) {
              return AlertDialog(
                title: Text("별젘주기"),
                content: Row(
                  children: [
                    Row(
                      children: [
                        for (int i = 0; i < 5; i++)
                          IconButton(
                            icon: Icon(Icons.star),
                            iconSize: 36.0,
                            color:
                                i < numberOfStars ? Colors.yellow : Colors.grey,
                            onPressed: () {
                              setStateInDialog(() {
                                setNumberOfStars(i + 1);
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
