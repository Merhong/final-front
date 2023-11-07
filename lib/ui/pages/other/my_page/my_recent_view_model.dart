import 'package:flutter_blog/data/dto/response_dto.dart';
import 'package:flutter_blog/data/dto/webtoon_dto/recent_DTO.dart';
import 'package:flutter_blog/data/provider/session_provider.dart';
import 'package:flutter_blog/data/repository/webtoon_repository.dart';
import 'package:flutter_blog/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 1. 창고 데이터

class MyRecentPageModel {
  List<RecentDTO> myRecentDTOList;
  String? sortCheck;

  MyRecentPageModel({required this.myRecentDTOList, this.sortCheck});

  MyRecentPageModel sortUpdate({required String sort}) {
    return MyRecentPageModel(
        myRecentDTOList: this.myRecentDTOList, sortCheck: sort);
  }
}

// 2. 창고
class MyRecentPageViewModel extends StateNotifier<MyRecentPageModel?> {
  Ref ref;
  final mContext = navigatorKey.currentContext;

  // StateNotifier<PostListModel?> 에서 PostListModel은 상태의 타입
  MyRecentPageViewModel(this.ref, super._state); // 상태가 바뀌면 자동으로 그려짐

  // notify 구독자들에게 알려줌
  Future<void> notifyInit() async {
    SessionUser sessionUser = ref.read(sessionProvider);
    ResponseDTO responseDTO =
        await WebtoonRepository().fetchMyRecent(sessionUser.jwt!);

    List<RecentDTO> myRecentDTOList = responseDTO.data;
    myRecentDTOList.sort((a, b) => b.updatedAt!.compareTo(a.updatedAt!));

    state = MyRecentPageModel(myRecentDTOList: myRecentDTOList);
  }

  Future<void> notifySort(String sort) async {
    state = state!.sortUpdate(sort: sort);
  }
}

// 3. 창고 관리자 (View가 빌드되기 직전에 생성됨)
final myRecentPageProvider = StateNotifierProvider.autoDispose<
    MyRecentPageViewModel, MyRecentPageModel?>((ref) {
  return new MyRecentPageViewModel(ref, null)..notifyInit();
  // return new MyRecentPageViewModel(ref, null);
});
