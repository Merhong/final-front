import 'package:flutter_blog/data/dto/response_dto.dart';
import 'package:flutter_blog/data/dto/user_dto/interest_author_add_DTO.dart';
import 'package:flutter_blog/data/dto/user_dto/interest_author_detail_DTO.dart';
import 'package:flutter_blog/data/provider/param_provider.dart';
import 'package:flutter_blog/data/provider/session_provider.dart';
import 'package:flutter_blog/data/repository/author_detail_repository.dart';
import 'package:flutter_blog/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

//1. 창고 데이터
class MyAuthorDetailPageModel {
  // List<InterestAuthorDTO> interestAuthorDTOList;
  InterestAuthorDetailDTO interestAuthorDetailDTO;

  MyAuthorDetailPageModel({required this.interestAuthorDetailDTO});

  MyAuthorDetailPageModel interestCountUpdate({required bool nowIsInterest}) {
    InterestAuthorDetailDTO updateDTO = this.interestAuthorDetailDTO;

    if (nowIsInterest == true) {
      updateDTO.interestCount = updateDTO.interestCount! + 1;
    } else {
      updateDTO.interestCount = updateDTO.interestCount! - 1;
    }
    updateDTO.isInterest = nowIsInterest;
    // if (nowIsInterest == true) {
    //   interestAuthorDetailDTO.isAlarm = true;
    // }
    // if (nowIsInterest == false) {
    //   interestAuthorDetailDTO.isAlarm = true;
    // }
    return MyAuthorDetailPageModel(interestAuthorDetailDTO: updateDTO);
  }
}

//2. 창고
class MyAuthorDetailPageViewModel extends StateNotifier<MyAuthorDetailPageModel?> {
  Ref ref;
  final mContext = navigatorKey.currentContext;

  // StateNotifier<PostListModel?> 에서 PostListModel은 상태의 타입
  MyAuthorDetailPageViewModel(this.ref, super._state); // 상태가 바뀌면 자동으로 그려짐

  // notify 구독자들에게 알려줌
  Future<void> notifyInit() async {
    // print("여기!!!!!!!");
    SessionUser sessionUser = ref.read(sessionProvider);
    int authorId = ref.read(paramProvider).authorMoveId!;
    // print("${authorId}");
    ResponseDTO responseDTO = await AuthorDetailRepository().fetchAuthorDetail(sessionUser.jwt!, authorId);

    // print("리포지토리완료");

    state = MyAuthorDetailPageModel(interestAuthorDetailDTO: responseDTO.data);
    // state = MyAuthorPageModel();
    // state!.webtoonDTO = responseDTO.data;
  }

  Future<void> notifyInterestCreate() async {
    SessionUser sessionUser = ref.read(sessionProvider);

    int authorId = state!.interestAuthorDetailDTO.id;
    ResponseDTO responseDTO = await AuthorDetailRepository().fetchInterestCreate(sessionUser.jwt!, authorId);

    if (responseDTO.success == false) {
      // notifyInterestDelete();
      return;
    }
    state = state!.interestCountUpdate(
      // updateInterestCount: (responseDTO.data as InterestAuthorAddDT),
      nowIsInterest: true,
    );
  }

  Future<void> notifyInterestDelete() async {
    SessionUser sessionUser = ref.read(sessionProvider);

    int authorId = state!.interestAuthorDetailDTO.id;
    ResponseDTO responseDTO = await AuthorDetailRepository().fetchInterestDelete(sessionUser.jwt!, authorId);

    if (responseDTO.success == false) {
      // notifyInterestDelete();
      return;
    }
    state = state!.interestCountUpdate(
      // updateInterestCount: (responseDTO.data as InterestAuthorAddDT),
      nowIsInterest: false,
    );
  }
}

final myAuthorDetailPageProvider = StateNotifierProvider.autoDispose<MyAuthorDetailPageViewModel, MyAuthorDetailPageModel?>((ref) {
  Logger().d("myAuthorPage창고관리자 실행됨");
  return new MyAuthorDetailPageViewModel(ref, null)..notifyInit();
  // return new MyAuthorPageViewModel(ref, null);
});
