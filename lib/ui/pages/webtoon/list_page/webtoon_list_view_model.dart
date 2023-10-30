import 'package:flutter_blog/data/dto/response_dto.dart';
import 'package:flutter_blog/data/dto/webtoon_DTO/list_page_webtoon_DTO.dart';
import 'package:flutter_blog/data/provider/session_provider.dart';
import 'package:flutter_blog/data/repository/webtoon_repository.dart';
import 'package:flutter_blog/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 1. 창고 데이터

class WebtoonListModel {
  List<ListPageWebtoonDTO> webtoonDTOList;
  String? weekCheck;

  WebtoonListModel({required this.webtoonDTOList, this.weekCheck});

  WebtoonListModel weekUpdate({required String week}) {
    return WebtoonListModel(webtoonDTOList: this.webtoonDTOList, weekCheck: week);
  }
}

// 2. 창고
class WebtoonListViewModel extends StateNotifier<WebtoonListModel?> {
  Ref ref;

  final mContext = navigatorKey.currentContext;

  WebtoonListViewModel(this.ref, super._state); // 상태가 바뀌면 자동으로 그려짐

  Future<void> notifyWeek(String week) async {
    state = state!.weekUpdate(week: week);

    // print("위크뷰모델위크");
  }

  // notify 구독자들에게 알려줌
  Future<void> notifyInit() async {
    SessionUser sessionUser = ref.read(sessionProvider);
    ResponseDTO responseDTO = await WebtoonRepository().fetchWebtoonList(sessionUser.jwt!);

    List<ListPageWebtoonDTO> webtoonDTOList = responseDTO.data;
    webtoonDTOList.sort((a, b) => (b.starScore ?? 0).compareTo(a.starScore ?? 0)); // 별점 총합 순 정렬

    state = WebtoonListModel(webtoonDTOList: webtoonDTOList);
  }
}

// 3. 창고 관리자 (View가 빌드되기 직전에 생성됨)
final webtoonListProvider = StateNotifierProvider<WebtoonListViewModel, WebtoonListModel?>((ref) {
  // Logger().d("webtoonList창고관리자 실행됨");
  return new WebtoonListViewModel(ref, null)..notifyInit();
});
