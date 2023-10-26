import 'package:flutter/material.dart';

class MyComment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0),
      child: Column(
        children: [
          Container(
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      "웹툰1",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      "베도/도전0",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      "최신순",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(Icons.arrow_drop_down),
                  ],
                ),
                Icon(
                  Icons.info,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white54,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text('총 댓글 수'),
                      Text('1'),
                    ],
                  ),
                  Column(
                    children: [
                      Text('총 답글 수'),
                      Text('0'),
                    ],
                  ),
                  Column(
                    children: [
                      Text('받은 좋아요 수'),
                      Text('0'),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // 댓글 컨테이너
          Container(
            height: 180,
            color: Colors.white,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "2023.10.25 15:25:49",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    Icon(Icons.close),
                  ],
                ),
                SizedBox(height: 15),
                Text('GGGG'),
                SizedBox(height: 15),
                Row(
                  children: [
                    Image.asset(
                      "assets/default_episode_Thumbnail.jpg",
                      width: 100,
                      height: 70,
                      fit: BoxFit.fill,
                    ),
                    SizedBox(width: 10),
                    Text(
                      "[화산귀환] 1화 >",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 30,
                        width: 50,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(2),
                          border: Border.all(color: Colors.black, width: 1),
                        ),
                        child: Center(
                          child: Text(
                            "댓글",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.thumb_up,
                                color: Colors.black,
                              ),
                              SizedBox(width: 5),
                              Text("0"),
                            ],
                          ),
                          SizedBox(width: 10),
                          Row(
                            children: [
                              Icon(
                                Icons.thumb_down,
                                color: Colors.black,
                              ),
                              SizedBox(width: 5),
                              Text("0"),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider(
            color: Colors.grey,
            thickness: 1,
          ),
        ],
      ),
    );
  }
}
