import 'package:flutter_blog/data/dto/response_dto.dart';
import 'package:flutter_blog/data/dto/user_dto/interest_webtoon_DTO.dart';
import 'package:flutter_blog/data/dto/webtoon_DTO/detail_page_webtoon_DTO.dart';
import 'package:flutter_blog/data/dto/webtoon_dto/interest_DTO.dart';
import 'package:flutter_blog/data/dto/webtoon_dto/interst_webtoon_DTO.dart';
import 'package:flutter_blog/data/provider/param_provider.dart';
import 'package:flutter_blog/data/provider/session_provider.dart';
import 'package:flutter_blog/data/repository/webtoon_repository.dart';
import 'package:flutter_blog/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 1. 창고 데이터

class MyPageModel {
  List<InterestWebtoonDTO> interestWebtoonDTOList;

  MyPageModel({required this.interestWebtoonDTOList});

  // MyPageModel interestCountUpdate({required int updateInterestCount, required bool nowIsInterest}) {
  //   DetailPageWebtoonDTO updateWebtoonDTO = this.webtoonDTO!;
  //   updateWebtoonDTO.interestCount = updateInterestCount;
  //   updateWebtoonDTO.isInterest = nowIsInterest;
  //   if (nowIsInterest == true) {
  //     updateWebtoonDTO.isAlarm = true;
  //   }
  //   if (nowIsInterest == false) {
  //     updateWebtoonDTO.isAlarm = true;
  //   }
  //   return MyPageModel(webtoonDTO: updateWebtoonDTO);
  // }

  // MyPageModel interestAlarmUpdate({required bool isAlarm}) {
  //   DetailPageWebtoonDTO updateWebtoonDTO = this.webtoonDTO!;
  //   updateWebtoonDTO.isAlarm = isAlarm;
  //   // updateWebtoonDTO.renderingSwitch = !(updateWebtoonDTO.renderingSwitch!);
  //   return MyPageModel(webtoonDTO: updateWebtoonDTO);
  // }
}

// 2. 창고
class MyPageViewModel extends StateNotifier<MyPageModel?> {
  Ref ref;
  final mContext = navigatorKey.currentContext;

  // StateNotifier<PostListModel?> 에서 PostListModel은 상태의 타입
  MyPageViewModel(this.ref, super._state); // 상태가 바뀌면 자동으로 그려짐

  // notify 구독자들에게 알려줌
  Future<void> notifyInit() async {
    SessionUser sessionUser = ref.read(sessionProvider);
    // int webtoonId = ref.read(paramProvider).webtoonDetailId!;
    ResponseDTO responseDTO = await WebtoonRepository().fetchInterestWebtoon(sessionUser.jwt!);
    state = MyPageModel(interestWebtoonDTOList: responseDTO.data);
    // state = MyPageModel();
    // state!.webtoonDTO = responseDTO.data;
  }
  //
  // Future<void> notifyInterestAlarmOn() async {
  //   SessionUser sessionUser = ref.read(sessionProvider);
  //
  //   int webtoonId = state!.webtoonDTO!.id;
  //   ResponseDTO responseDTO = await WebtoonRepository().fetchInterestAlarmOn(sessionUser.jwt!, webtoonId);
  //
  //   if (responseDTO.success == false) {
  //     print("if로감On");
  //     return;
  //   }
  //
  //   state = state!.interestAlarmUpdate(isAlarm: (responseDTO.data as InterestWebtoonDTO).isAlarm);
  // }
  //
  // Future<void> notifyInterestAlarmOff() async {
  //   SessionUser sessionUser = ref.read(sessionProvider);
  //
  //   int webtoonId = state!.webtoonDTO!.id;
  //   ResponseDTO responseDTO = await WebtoonRepository().fetchInterestAlarmOff(sessionUser.jwt!, webtoonId);
  //
  //   if (responseDTO.success == false) {
  //     print("if로감Off");
  //     return;
  //   }
  //
  //   state = state!.interestAlarmUpdate(isAlarm: (responseDTO.data as InterestWebtoonDTO).isAlarm);
  // }
  //
  // Future<void> notifyInterestCreate() async {
  //   SessionUser sessionUser = ref.read(sessionProvider);
  //
  //   int webtoonId = state!.webtoonDTO!.id;
  //   ResponseDTO responseDTO = await WebtoonRepository().fetchInterestCreate(sessionUser.jwt!, webtoonId);
  //
  //   if (responseDTO.success == false) {
  //     // notifyInterestDelete();
  //     return;
  //   }
  //   state = state!.interestCountUpdate(
  //     updateInterestCount: (responseDTO.data as InterestDTO).webtoonTotalInterest,
  //     nowIsInterest: true,
  //   );
  //   // state!.webtoonDTO!.interestCount = (responseDTO.data as InterestDTO).webtoonTotalInterest; // TODO 이거론 왜 안되지
  // }
  //
  // Future<void> notifyInterestDelete() async {
  //   SessionUser sessionUser = ref.read(sessionProvider);
  //
  //   int webtoonId = state!.webtoonDTO!.id;
  //   ResponseDTO responseDTO = await WebtoonRepository().fetchInterestDelete(sessionUser.jwt!, webtoonId);
  //
  //   if (responseDTO.success == false) {
  //     // notifyInterestCreate();
  //     return;
  //   }
  //   state = state!.interestCountUpdate(
  //     updateInterestCount: (responseDTO.data as InterestDTO).webtoonTotalInterest,
  //     nowIsInterest: false,
  //   );
  //   // state!.webtoonDTO!.interestCount = (responseDTO.data as InterestDTO).webtoonTotalInterest; // TODO 이거론 왜 안되지
  // }

//
// Future<void> notifyAdd(PostSaveReqDTO dto) async {
//   SessionUser sessionUser = ref.read(sessionProvider);
//
//   ResponseDTO responseDTO = await PostRepository().savePost(sessionUser.jwt!, dto);
//
//   if (responseDTO.code == 1) {
//     Post newPost = responseDTO.data as Post; // 1. dynamic(Post)
//
//     // ResponseDTO response2DTO = await PostRepository().fetchPostList(sessionUser.jwt!);
//     // state = PostListModel(posts: response2DTO.data);
//
//     List<Post> newPosts = [newPost, ...state!.posts]; // 2. 기존 상태에 데이터 추가
//     state = WebtoonDetailModel(posts: newPosts); // 3. 뷰모델(창고) 데이터 갱신 -> watch 구독자 자동으로 리빌드됨
//     // 다만 글 작성 하는 중간에 다른 사람이 글을 적었다고 치면 그 글은 안보임
//
//     Navigator.pop(mContext!);
//   } else {
//     ScaffoldMessenger.of(mContext!).showSnackBar(SnackBar(content: Text("게시물 작성 실패 : ${responseDTO.msg}")));
//   }
// }

//
}

// 3. 창고 관리자 (View가 빌드되기 직전에 생성됨)
final myPageProvider = StateNotifierProvider.autoDispose<MyPageViewModel, MyPageModel?>((ref) {
  // Logger().d("myPage창고관리자 실행됨");
  return new MyPageViewModel(ref, null)..notifyInit();
  // return new MyPageViewModel(ref, null);
});
