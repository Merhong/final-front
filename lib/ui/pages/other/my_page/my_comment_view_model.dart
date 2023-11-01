import 'package:flutter_blog/data/dto/comment_dto/comment_delete_DTO.dart';
import 'package:flutter_blog/data/dto/response_dto.dart';
import 'package:flutter_blog/data/dto/user_dto/interest_webtoon_DTO.dart';
import 'package:flutter_blog/data/dto/user_dto/my_comment_DTO.dart';
import 'package:flutter_blog/data/provider/session_provider.dart';
import 'package:flutter_blog/data/repository/comment_repository.dart';
import 'package:flutter_blog/data/repository/webtoon_repository.dart';
import 'package:flutter_blog/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 1. 창고 데이터

class MyCommentPageModel {
  List<MyCommentDTO> myCommentDTOList;

  MyCommentPageModel({required this.myCommentDTOList});

  MyCommentPageModel deleteUpdate(CommentDeleteDTO commentDeleteDTO) {
    List<MyCommentDTO> updateMyCommentList = this.myCommentDTOList;

    // MyCommentDTO updateMyComment = updateMyCommentList.firstWhere((myCommentDTO) => myCommentDTO.id == commentDeleteDTO.deletedId);
    updateMyCommentList = updateMyCommentList.where((myCommentDTO) => myCommentDTO.commentId != commentDeleteDTO.deletedId).toList();

    print("my댓글 댓글삭제");

    return MyCommentPageModel(myCommentDTOList: updateMyCommentList);
  }
}

// 2. 창고
class MyCommentPageViewModel extends StateNotifier<MyCommentPageModel?> {
  Ref ref;
  final mContext = navigatorKey.currentContext;

  // StateNotifier<PostListModel?> 에서 PostListModel은 상태의 타입
  MyCommentPageViewModel(this.ref, super._state); // 상태가 바뀌면 자동으로 그려짐

  // notify 구독자들에게 알려줌
  Future<void> notifyInit() async {
    SessionUser sessionUser = ref.read(sessionProvider);
    ResponseDTO responseDTO = await CommentRepository().fetchMyComment(sessionUser.jwt!);
    state = MyCommentPageModel(myCommentDTOList: responseDTO.data);
  }

  Future<void> notifyCommentDelete(int commentId) async {
    SessionUser sessionUser = ref.read(sessionProvider);
    ResponseDTO responseDTO = await CommentRepository().fetchCommentDelete(sessionUser.jwt!, commentId);

    if (responseDTO.success == false) {
      print("if로감CommentDelete");
      return;
    }
    state = state!.deleteUpdate(responseDTO.data as CommentDeleteDTO);
  }

// Future<void> notifyMyInterestAlarm(InterestWebtoonDTO paramDTO) async {
  //   SessionUser sessionUser = ref.read(sessionProvider);
  //
  //   ResponseDTO responseDTO;
  //   if (paramDTO.isAlarm == true) {
  //     responseDTO = await WebtoonRepository().fetchInterestAlarmOff(sessionUser.jwt!, paramDTO.webtoonId);
  //   } else {
  //     responseDTO = await WebtoonRepository().fetchInterestAlarmOn(sessionUser.jwt!, paramDTO.webtoonId);
  //   }
  //
  //   if (responseDTO.success == false) {
  //     print("if로감On");
  //     return;
  //   }
  //
  //   List<InterestWebtoonDTO> interestWebtoonDTOList = state!.interestWebtoonDTOList;
  //   InterestWebtoonDTO updateInterestWebtoonDTO = responseDTO.data as InterestWebtoonDTO;
  //   interestWebtoonDTOList = interestWebtoonDTOList.map((e) => e.id == paramDTO.id ? updateInterestWebtoonDTO : e).toList();
  //
  //   state = state!.interestAlarmUpdate(interestWebtoonDTOList: interestWebtoonDTOList);
  // }
}

// 3. 창고 관리자 (View가 빌드되기 직전에 생성됨)
final myCommentPageProvider = StateNotifierProvider.autoDispose<MyCommentPageViewModel, MyCommentPageModel?>((ref) {
  // Logger().d("myWebtoonPage창고관리자 실행됨");
  return new MyCommentPageViewModel(ref, null)..notifyInit();
  // return new MyWebtoonPageViewModel(ref, null);
});
