import 'package:flutter/material.dart';
import 'package:flutter_blog/data/dto/comment_dto/comment_DTO.dart';
import 'package:flutter_blog/data/dto/comment_dto/comment_delete_DTO.dart';
import 'package:flutter_blog/data/dto/comment_dto/re_comment_DTO.dart';
import 'package:flutter_blog/data/dto/comment_dto/re_comment_delete_DTO.dart';
import 'package:flutter_blog/data/dto/reply_request.dart';
import 'package:flutter_blog/data/dto/response_dto.dart';
import 'package:flutter_blog/data/dto/webtoon_dto/comment_like_DTO.dart';
import 'package:flutter_blog/data/dto/webtoon_dto/re_comment_like_DTO.dart';
import 'package:flutter_blog/data/provider/param_provider.dart';
import 'package:flutter_blog/data/provider/session_provider.dart';
import 'package:flutter_blog/data/repository/comment_repository.dart';
import 'package:flutter_blog/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 1. 창고 데이터

class WebtoonReplyModel {
  List<CommentDTO> commentList;
  WebtoonReplyModel({required this.commentList});

  //

  WebtoonReplyModel reCommentLikeUpdate(ReCommentLikeDTO reCommentLikeDTO) {
    List<CommentDTO> updateCommentList = this.commentList;
    CommentDTO updateComment = updateCommentList.firstWhere((commentDTO) => commentDTO.id == reCommentLikeDTO.commentId);

    if (reCommentLikeDTO.isLike == true) {
      final updateReComment = updateComment.reCommentList.firstWhere((reCommentDTO) => reCommentDTO.id == reCommentLikeDTO.reCommentId);
      updateReComment.likeReCommentCount++;
      updateReComment.isMyLike = true;
      updateReComment.isMyDislike = false;
      print("대댓글좋아요등록${reCommentLikeDTO.isLike}");
    }
    if (reCommentLikeDTO.isLike == false) {
      final updateReComment = updateComment.reCommentList.firstWhere((reCommentDTO) => reCommentDTO.id == reCommentLikeDTO.reCommentId);
      updateReComment.dislikeReCommentCount++;
      updateReComment.isMyDislike = true;
      updateReComment.isMyLike = false;
      print("대댓글싫어요등록${reCommentLikeDTO.isLike}");
    }
    return WebtoonReplyModel(commentList: updateCommentList);
  }

  WebtoonReplyModel reCommentlikeDelete(ReCommentLikeDTO reCommentLikeDTO) {
    List<CommentDTO> updateCommentList = this.commentList;
    CommentDTO updateComment = updateCommentList.firstWhere((commentDTO) => commentDTO.id == reCommentLikeDTO.commentId);

    if (reCommentLikeDTO.isLike == true) {
      final updateReComment = updateComment.reCommentList.firstWhere((reCommentDTO) => reCommentDTO.id == reCommentLikeDTO.reCommentId);
      updateReComment.likeReCommentCount--;
      updateReComment.isMyLike = false;
      updateReComment.isMyDislike = false;
      print("대댓글좋아요취소${reCommentLikeDTO.isLike}");
    }
    if (reCommentLikeDTO.isLike == false) {
      final updateReComment = updateComment.reCommentList.firstWhere((reCommentDTO) => reCommentDTO.id == reCommentLikeDTO.reCommentId);
      updateReComment.dislikeReCommentCount--;
      updateReComment.isMyDislike = false;
      updateReComment.isMyLike = false;
      print("대댓글싫어요취소${reCommentLikeDTO.isLike}");
    }
    return WebtoonReplyModel(commentList: updateCommentList);
  }

  WebtoonReplyModel reCommentDeleteUpdate(ReCommentDeleteDTO reCommentDeleteDTO) {
    List<CommentDTO> updateCommentList = this.commentList;

    CommentDTO updateComment = updateCommentList.firstWhere((commentDTO) => commentDTO.id == reCommentDeleteDTO.commentId);

    ReCommentDTO updateReComment = updateComment.reCommentList.firstWhere((reCommentDTO) => reCommentDTO.id == reCommentDeleteDTO.deletedId);

    updateReComment.isDelete = true;
    print("대댓글삭제함${updateReComment.isDelete}");

    return WebtoonReplyModel(commentList: updateCommentList);
  }

  WebtoonReplyModel deleteUpdate(CommentDeleteDTO commentDeleteDTO) {
    List<CommentDTO> updateCommentList = this.commentList;

    final updateComment = updateCommentList.firstWhere((commentDTO) => commentDTO.id == commentDeleteDTO.deletedId);
    updateComment.isDelete = true;
    print("댓글삭제함${updateComment.isDelete}");

    return WebtoonReplyModel(commentList: updateCommentList);
  }

  WebtoonReplyModel likeUpdate(CommentLikeDTO commentLikeDTO) {
    List<CommentDTO> updateCommentList = this.commentList;

    if (commentLikeDTO.isLike == true) {
      // updateCommentList.firstWhere((commentDTO) => commentDTO.id == commentLikeDTO.commentId).likeCommentCount++;
      // updateCommentList.firstWhere((commentDTO) => commentDTO.id == commentLikeDTO.commentId).isMyLike = true;
      final updateComment = updateCommentList.firstWhere((commentDTO) => commentDTO.id == commentLikeDTO.commentId);
      updateComment.likeCommentCount++;
      updateComment.isMyLike = true;
      updateComment.isMyDislike = false;
      print("댓글좋아요등록${commentLikeDTO.isLike}");
    }
    if (commentLikeDTO.isLike == false) {
      // updateCommentList.firstWhere((commentDTO) => commentDTO.id == commentLikeDTO.commentId).dislikeCommentCount++;
      // updateCommentList.firstWhere((commentDTO) => commentDTO.id == commentLikeDTO.commentId).isMyDislike = true;
      final updateComment = updateCommentList.firstWhere((commentDTO) => commentDTO.id == commentLikeDTO.commentId);
      updateComment.dislikeCommentCount++;
      updateComment.isMyDislike = true;
      updateComment.isMyLike = false;
      print("댓글싫어요등록${commentLikeDTO.isLike}");
    }
    return WebtoonReplyModel(commentList: updateCommentList);
  }

  WebtoonReplyModel likeDelete(CommentLikeDTO commentLikeDTO) {
    List<CommentDTO> updateCommentList = this.commentList;

    if (commentLikeDTO.isLike == true) {
      // updateCommentList.firstWhere((commentDTO) => commentDTO.id == commentLikeDTO.commentId).likeCommentCount++;
      // updateCommentList.firstWhere((commentDTO) => commentDTO.id == commentLikeDTO.commentId).isMyLike = true;
      final updateComment = updateCommentList.firstWhere((commentDTO) => commentDTO.id == commentLikeDTO.commentId);
      updateComment.likeCommentCount--;
      updateComment.isMyLike = false;
      updateComment.isMyDislike = false;
      print("댓글좋아요취소${commentLikeDTO.isLike}");
    }
    if (commentLikeDTO.isLike == false) {
      // updateCommentList.firstWhere((commentDTO) => commentDTO.id == commentLikeDTO.commentId).dislikeCommentCount++;
      // updateCommentList.firstWhere((commentDTO) => commentDTO.id == commentLikeDTO.commentId).isMyDislike = true;
      final updateComment = updateCommentList.firstWhere((commentDTO) => commentDTO.id == commentLikeDTO.commentId);
      updateComment.dislikeCommentCount--;
      updateComment.isMyDislike = false;
      updateComment.isMyLike = false;
      print("댓글싫어요취소${commentLikeDTO.isLike}");
    }
    return WebtoonReplyModel(commentList: updateCommentList);
  }
}

// 2. 창고
class WebtoonReplyViewModel extends StateNotifier<WebtoonReplyModel?> {
  Ref ref;

  final mContext = navigatorKey.currentContext;

  WebtoonReplyViewModel(this.ref, super._state); // 상태가 바뀌면 자동으로 그려짐

  // notify 구독자들에게 알려줌
  Future<void> notifyInit() async {
    SessionUser sessionUser = ref.read(sessionProvider);
    int episodeId = ref.read(paramProvider).episodeId!;
    ResponseDTO responseDTO = await CommentRepository().fetchCommentList(sessionUser.jwt!, episodeId);
    state = WebtoonReplyModel(commentList: responseDTO.data);
  }

  Future<void> notifyReCommentCreate(ReplyReqDTO dto) async {
    SessionUser sessionUser = ref.read(sessionProvider);
    int commentId = ref.read(paramProvider).commentId!;
    ResponseDTO responseDTO = await CommentRepository().fetchReCommentCreate(sessionUser.jwt!, dto, commentId);

    if (responseDTO.success == false) {
      return;
    }

    ReCommentDTO newDTO = responseDTO.data as ReCommentDTO;

    List<CommentDTO> updateCommentList = state!.commentList;

    CommentDTO updateComment = updateCommentList.firstWhere((commentDTO) => commentDTO.id == newDTO.commentId);

    updateComment.reCommentList = [newDTO, ...updateComment.reCommentList];
    state = new WebtoonReplyModel(commentList: updateCommentList);
  }

  Future<void> notifyReCommentLike(int reCommentId) async {
    SessionUser sessionUser = ref.read(sessionProvider);
    ResponseDTO responseDTO = await CommentRepository().fetchReCommentLike(sessionUser.jwt!, reCommentId);

    if (responseDTO.success == false) {
      print("if로감ReCommentLike");
      return;
    }
    state = state!.reCommentLikeUpdate(responseDTO.data as ReCommentLikeDTO);
  }

  Future<void> notifyReCommentDislike(int reCommentId) async {
    SessionUser sessionUser = ref.read(sessionProvider);
    ResponseDTO responseDTO = await CommentRepository().fetchReCommentDislike(sessionUser.jwt!, reCommentId);

    if (responseDTO.success == false) {
      print("if로감ReCommentDislike");
      return;
    }
    state = state!.reCommentLikeUpdate(responseDTO.data as ReCommentLikeDTO);
  }

  Future<void> notifyReCommentLikecancel(int reCommentId) async {
    SessionUser sessionUser = ref.read(sessionProvider);
    ResponseDTO responseDTO = await CommentRepository().fetchReCommentLikecancel(sessionUser.jwt!, reCommentId);

    if (responseDTO.success == false) {
      print("if로감ReCommentLike캔슬");
      return;
    }
    state = state!.reCommentlikeDelete(responseDTO.data as ReCommentLikeDTO);
    print("끝끝끝끝끝끝끝");
  }

  Future<void> notifyReCommentDelete(int reCommentId) async {
    SessionUser sessionUser = ref.read(sessionProvider);
    ResponseDTO responseDTO = await CommentRepository().fetchReCommentDelete(sessionUser.jwt!, reCommentId);

    if (responseDTO.success == false) {
      print("if로감ReCommentDelete");
      return;
    }
    state = state!.reCommentDeleteUpdate(responseDTO.data as ReCommentDeleteDTO);
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

  Future<void> notifyCommentLike(int commentId) async {
    SessionUser sessionUser = ref.read(sessionProvider);
    ResponseDTO responseDTO = await CommentRepository().fetchCommentLike(sessionUser.jwt!, commentId);

    if (responseDTO.success == false) {
      print("if로감CommentLike");
      return;
    }
    state = state!.likeUpdate(responseDTO.data as CommentLikeDTO);
  }

  Future<void> notifyCommentDislike(int commentId) async {
    SessionUser sessionUser = ref.read(sessionProvider);
    ResponseDTO responseDTO = await CommentRepository().fetchCommentDislike(sessionUser.jwt!, commentId);

    if (responseDTO.success == false) {
      print("if로감CommentDislike");
      return;
    }
    state = state!.likeUpdate(responseDTO.data as CommentLikeDTO);
  }

  Future<void> notifyCommentLikecancel(int commentId) async {
    SessionUser sessionUser = ref.read(sessionProvider);
    ResponseDTO responseDTO = await CommentRepository().fetchCommentLikecancel(sessionUser.jwt!, commentId);

    if (responseDTO.success == false) {
      print("if로감CommentLike캔슬");
      return;
    }
    state = state!.likeDelete(responseDTO.data as CommentLikeDTO);
  }

  Future<void> notifyCommentCreate(ReplyReqDTO dto) async {
    SessionUser sessionUser = ref.read(sessionProvider);
    int episodeId = ref.read(paramProvider).episodeId!;
    ResponseDTO responseDTO = await CommentRepository().fetchCommentCreate(sessionUser.jwt!, dto, episodeId);

    if (responseDTO.success == false) {
      return;
    }
    // state = state!.interestCountUpdate(
    //   updateInterestCount: (responseDTO.data as InterestDTO).webtoonTotalInterest,
    //   nowIsInterest: false,
    // );

    CommentDTO newDTO = responseDTO.data as CommentDTO;
    List<CommentDTO> newCommentList = [newDTO, ...state!.commentList];
    state = new WebtoonReplyModel(commentList: newCommentList);
  }
}

// 3. 창고 관리자 (View가 빌드되기 직전에 생성됨)
final webtoonReplyProvider = StateNotifierProvider.autoDispose<WebtoonReplyViewModel, WebtoonReplyModel?>((ref) {
  // Logger().d("webtoonReply창고관리자 실행됨");
  return new WebtoonReplyViewModel(ref, null)..notifyInit();
});
