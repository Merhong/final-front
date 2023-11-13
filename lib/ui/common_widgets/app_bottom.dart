import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/move.dart';
import 'package:flutter_blog/_core/constants/my_color.dart';
import 'package:flutter_blog/data/provider/param_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppBottom extends ConsumerStatefulWidget {
  const AppBottom({
    super.key,
  });

  @override
  _AppBottomState createState() => _AppBottomState();
}

class _AppBottomState extends ConsumerState<AppBottom> {
  late ParamStore ps;

  @override
  Widget build(BuildContext context) {
    ps = ref.read(paramProvider);

    // return WillPopScope(
    //   onWillPop: () {
    //     if () {
    //       ps.addBottomNavigationBarIndex(0);
    //       print("뒤로가기${ps.bottomNavigationBarIndex}");
    //       Navigator.pushNamedAndRemoveUntil(context, Move.homeListPage, (route) => false);
    //       return Future.value(false);
    //     }
    //     return Future.value(true);
    //   },
    return Container(
      height: 50,
      decoration: BoxDecoration(
        border: Border(
            top: BorderSide(color: CommonColors.grey, width: 1.0)), // 라인효과
      ),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        // 아이템 너비 고정
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.propane_tank_outlined,
              color: ps.bottomNavigationBarIndex == null ||
                      ps.bottomNavigationBarIndex == 0
                  ? Colors.black
                  : CommonColors.grey,
            ),
            label: '웹툰',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.book_outlined,
              color: ps.bottomNavigationBarIndex == 1
                  ? Colors.black
                  : CommonColors.grey,
            ),
            label: '추천완결',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.assistant_outlined,
              color: ps.bottomNavigationBarIndex == 2
                  ? Colors.black
                  : CommonColors.grey,
            ),
            label: '베스트도전',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.emoji_emotions_outlined,
                color: ps.bottomNavigationBarIndex == 3
                    ? Colors.black
                    : Colors.grey),
            label: 'My',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_view,
                color: ps.bottomNavigationBarIndex == 4
                    ? Colors.black
                    : CommonColors.grey),
            label: '더보기',
          ),
        ],

        // 선택된 아이템의 아이콘 및 라벨 텍스트 색상
        selectedItemColor: Colors.grey[700],
        // 선택되지 않은 아이템의 아이콘 및 라벨 텍스트 색상
        unselectedItemColor: Colors.grey[700],
        backgroundColor: Colors.white,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        onTap: (value) => onItemTapped(value, context, ps),
      ),
    );
  }
}

void onItemTapped(int index, BuildContext context, ParamStore ps) {
  // 웹툰
  if (index == 0) {
    Navigator.pushNamedAndRemoveUntil(
        context, Move.homeListPage, (route) => false);
  }
  // 추천완결
  else if (index == 1 && ps.bottomNavigationBarIndex != index) {
    Navigator.pushNamedAndRemoveUntil(
        context, Move.recommendPage, (route) => false);
  }
  // 베스트 도전
  else if (index == 2 && ps.bottomNavigationBarIndex != index) {
    Navigator.pushNamedAndRemoveUntil(context, Move.bestPage, (route) => false);
  }
  // MY
  else if (index == 3 && ps.bottomNavigationBarIndex != index) {
    Navigator.pushNamedAndRemoveUntil(context, Move.myPage, (route) => false);
  }
  // 더보기
  else if (index == 4 && ps.bottomNavigationBarIndex != index) {
    Navigator.pushNamedAndRemoveUntil(
        context, Move.seeMorePage, (route) => false);
  } else {
    print("아무실행안됨");
    return;
  }

  ps.bottomNavigationBarIndex = index;
  print("${index}테스트${ps.bottomNavigationBarIndex}");
}
