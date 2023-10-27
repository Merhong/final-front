import 'package:flutter_riverpod/flutter_riverpod.dart';

// 1. 창고 데이터
class WeekModel {
  String week;

  WeekModel(this.week);
}

// 2. 창고
class WeekViewModel extends StateNotifier<WeekModel?> {
  Ref ref;

  WeekViewModel(super._state, this.ref);

  Future<void> notifyWeek(String week) async {
    state = WeekModel(week);
    // print("위크뷰모델위크");
  }

  Future<void> notifyInit() async {
    state = WeekModel("모두");
    // print("위크뷰모델인잇");
  }
}

// 3. 창고 관리자 (View 빌드되기 직전에 생성됨)
final weekProvider =
    StateNotifierProvider.autoDispose<WeekViewModel, WeekModel?>((ref) {
  // print("위크창고관리자");
  return WeekViewModel(null, ref)..notifyInit();
});
