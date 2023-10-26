import 'package:flutter_blog/data/dto/comment_dto/comment_DTO.dart';
import 'package:flutter_blog/data/dto/response_dto.dart';
import 'package:flutter_blog/data/dto/webtoon_DTO/list_page_webtoon_DTO.dart';
import 'package:flutter_blog/data/provider/param_provider.dart';
import 'package:flutter_blog/data/repository/episode_repository.dart';
import 'package:flutter_blog/data/repository/webtoon_repository.dart';
import 'package:flutter_blog/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 1. 창고 데이터

class WebtoonReplyModel {
  List<CommentDTO> commentList;

  WebtoonReplyModel({required this.commentList});
}

// 2. 창고
class WebtoonReplyViewModel extends StateNotifier<WebtoonReplyModel?> {
  Ref ref;

  final mContext = navigatorKey.currentContext;

  WebtoonReplyViewModel(this.ref, super._state); // 상태가 바뀌면 자동으로 그려짐

  // notify 구독자들에게 알려줌
  Future<void> notifyInit() async {
    int episodeId = ref.read(paramProvider).episodeId!;
    ResponseDTO responseDTO = await EpisodeRepository().fetchCommentList("jwt임시", episodeId);
    state = WebtoonReplyModel(commentList: responseDTO.data);
  }
}

// 3. 창고 관리자 (View가 빌드되기 직전에 생성됨)
final webtoonReplyProvider = StateNotifierProvider.autoDispose<WebtoonReplyViewModel, WebtoonReplyModel?>((ref) {
  // Logger().d("webtoonReply창고관리자 실행됨");
  return new WebtoonReplyViewModel(ref, null)..notifyInit();
});
