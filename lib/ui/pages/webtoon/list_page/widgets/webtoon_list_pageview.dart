import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/_core/constants/size.dart';

class WebtoonListPageView extends StatefulWidget {
  const WebtoonListPageView({
    super.key,
  });

  @override
  State<WebtoonListPageView> createState() => _WebtoonListPageViewState();
}

class _WebtoonListPageViewState extends State<WebtoonListPageView> {
  int currentPage = 0;
  PageController _PageController = PageController(
    initialPage: 0,
  );

  @override
  void initState() {
    super.initState();

    Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (currentPage < 10) {
        currentPage++;
      } else {
        currentPage = 0;
      }

      _PageController.animateToPage(
        currentPage,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 210,
      // width: sizeGetScreenWidth(context),
      child: PageView.builder(
        pageSnapping: true,
        controller: _PageController,
        onPageChanged: (value) {
          currentPage = value;
          // print("페이지넘김currentPage:${currentPage}");
          // print("value${value}");
        },
        itemCount: 10,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              Container(
                height: double.infinity,
                width: sizeGetScreenWidth(context),
                child: Image.network(
                  "${imageURL}OtherImage/${index + 21}.jpg",
                  fit: BoxFit.cover,
                ),
              ),
              Align(
                alignment: Alignment(0.9, 0.55),
                child: Container(
                  decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.all(Radius.circular(sizeBorder5))),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(4, 2, 4, 2),
                    child: Text(
                      "${index + 1} / 10",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: sizePaddingLR17),
                child: Align(
                  alignment: Alignment(0, 1),
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(sizeBorder5),
                      ),
                      color: Color.fromARGB(255, 200, index * 110, index * 20),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.all(
                                Radius.circular(sizeBorder5),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(1.0),
                              child: Text(
                                "매일+",
                                style: TextStyle(color: Colors.white, fontSize: 12),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          SizedBox(width: sizeS5),
                          Container(
                            constraints: BoxConstraints(maxWidth: sizeGetScreenWidth(context) * 0.5),
                            child: Text("무한 레벨업 in 무림", style: Theme.of(context).textTheme.bodyLarge, overflow: TextOverflow.ellipsis),
                          ),
                          SizedBox(width: sizeS5),
                          Container(
                            constraints: BoxConstraints(maxWidth: sizeGetScreenWidth(context) * 0.3),
                            child: Text("김진우 / 곤봉", style: TextStyle(fontSize: 15, color: Colors.grey), overflow: TextOverflow.ellipsis),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
