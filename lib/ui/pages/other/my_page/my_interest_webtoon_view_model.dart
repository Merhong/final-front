import 'package:flutter_blog/data/dto/response_dto.dart';
import 'package:flutter_blog/data/dto/user_dto/interest_webtoon_DTO.dart';
import 'package:flutter_blog/data/provider/session_provider.dart';
import 'package:flutter_blog/data/repository/webtoon_repository.dart';
import 'package:flutter_blog/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 1. 창고 데이터

class MyWebtoonPageModel {
  List<InterestWebtoonDTO> interestWebtoonDTOList;
  String? sortCheck;

  MyWebtoonPageModel({required this.interestWebtoonDTOList, this.sortCheck});

  MyWebtoonPageModel interestAlarmUpdate({required List<InterestWebtoonDTO> interestWebtoonDTOList}) {
    return MyWebtoonPageModel(interestWebtoonDTOList: interestWebtoonDTOList, sortCheck: this.sortCheck);
  }

  MyWebtoonPageModel sortUpdate({required String sort}) {
    return MyWebtoonPageModel(interestWebtoonDTOList: this.interestWebtoonDTOList, sortCheck: sort);
  }
}

// 2. 창고
class MyWebtoonPageViewModel extends StateNotifier<MyWebtoonPageModel?> {
  Ref ref;
  final mContext = navigatorKey.currentContext;

  // StateNotifier<PostListModel?> 에서 PostListModel은 상태의 타입
  MyWebtoonPageViewModel(this.ref, super._state); // 상태가 바뀌면 자동으로 그려짐

  // notify 구독자들에게 알려줌
  Future<void> notifyInit() async {
    SessionUser sessionUser = ref.read(sessionProvider);
    // int webtoonId = ref.read(paramProvider).webtoonDetailId!;
    ResponseDTO responseDTO = await WebtoonRepository().fetchInterestWebtoon(sessionUser.jwt!);
    state = MyWebtoonPageModel(interestWebtoonDTOList: responseDTO.data);
    // state = MyWebtoonPageModel();
    // state!.webtoonDTO = responseDTO.data;
  }

  Future<void> notifyMyInterestAlarm(InterestWebtoonDTO paramDTO) async {
    SessionUser sessionUser = ref.read(sessionProvider);

    ResponseDTO responseDTO;
    if (paramDTO.isAlarm == true) {
      responseDTO = await WebtoonRepository().fetchInterestAlarmOff(sessionUser.jwt!, paramDTO.webtoonId);
    } else {
      responseDTO = await WebtoonRepository().fetchInterestAlarmOn(sessionUser.jwt!, paramDTO.webtoonId);
    }

    if (responseDTO.success == false) {
      print("if로감On");
      return;
    }

    List<InterestWebtoonDTO> interestWebtoonDTOList = state!.interestWebtoonDTOList;
    InterestWebtoonDTO updateInterestWebtoonDTO = responseDTO.data as InterestWebtoonDTO;
    interestWebtoonDTOList = interestWebtoonDTOList.map((e) => e.id == paramDTO.id ? updateInterestWebtoonDTO : e).toList();

    state = state!.interestAlarmUpdate(interestWebtoonDTOList: interestWebtoonDTOList);
  }

  Future<void> notifySort(String sort) async {
    state = state!.sortUpdate(sort: sort);
  }
}

// 3. 창고 관리자 (View가 빌드되기 직전에 생성됨)
final myWebtoonPageProvider = StateNotifierProvider.autoDispose<MyWebtoonPageViewModel, MyWebtoonPageModel?>((ref) {
  // Logger().d("myWebtoonPage창고관리자 실행됨");
  return new MyWebtoonPageViewModel(ref, null)..notifyInit();
  // return new MyWebtoonPageViewModel(ref, null);
});
