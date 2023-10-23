import 'package:flutter/material.dart';

import '../../../../common_widgets/my_sliver_persistent_header_delegate.dart';

class WebtoonListSliverPersistentHeader extends StatelessWidget {
  const WebtoonListSliverPersistentHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      floating: false,
      delegate: MySliverPersistentHeaderDelegate(
        minHeight: 45.0,
        maxHeight: 45.0,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.symmetric(horizontal: BorderSide(color: Colors.grey, width: 1.0)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("신작", style: TextStyle(color: Colors.black)),
              Text("매일+", style: TextStyle(color: Colors.black)),
              InkWell(
                  onTap: () {
                    print("클릭");
                  },
                  child: Text("월", style: TextStyle(color: Colors.black))),
              InkWell(
                  onTap: () {
                    print("클릭");
                  },
                  child: Text("화", style: TextStyle(color: Colors.black))),
              Text("수", style: TextStyle(color: Colors.black)),
              Text("목", style: TextStyle(color: Colors.black)),
              Text("금", style: TextStyle(color: Colors.black)),
              Text("토", style: TextStyle(color: Colors.black)),
              Text("일", style: TextStyle(color: Colors.black)),
              Text("완결", style: TextStyle(color: Colors.black)),
            ],
          ),
        ),
      ),
    );
  }
}
