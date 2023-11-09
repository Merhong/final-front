import 'package:flutter_blog/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 1. 창고 데이터
class RequestParam {
  int? webtoonDetailId;
  bool? isWebtoonDetailMove;
  int? episodeId;
  bool? isEpisodeMove;
  int? webtoonLastEpisodeId;
  int? webtoonFirstEpisodeId;
  int? commentId;
  int? authorMoveId;
  int? bottomNavigationBarIndex;
  String? searchText;
  bool? isSearchMove;
  bool? isAutoLogin = false;
  bool? isLoginMove = false;

  RequestParam({this.webtoonDetailId});
}

// 2. 창고 (비지니스 로직)
class ParamStore extends RequestParam {
  final mContext = navigatorKey.currentContext;
  void addWebtoonLastEpisode(int episodeId) {
    print("에피소드끝:${episodeId}");
    this.webtoonLastEpisodeId = episodeId;
  }

  void addWebtoonFirstEpisode(int episodeId) {
    print("에피소드처음:${episodeId}");
    this.webtoonFirstEpisodeId = episodeId;
  }

  // void addIsEpisodeMove() {
  //   print("에피소드이동감지");
  //   this.isEpisodeMove = true;
  // }

  void addWebtoonDetailId(int webtoonId) {
    print("파람프로바이더webtoonDetailId : ${webtoonId}");
    this.webtoonDetailId = webtoonId;
  }

  void addEpisodeDetailId(int episodeId) {
    print("파람episodeDetailId : ${episodeId}");
    this.episodeId = episodeId;
  }

  void addCommentDetailId(int commentId) {
    print("파람commentDetailId : ${commentId}");
    this.commentId = commentId;
  }

  void addBottomNavigationBarIndex(int id) {
    print("파람addBottomNavigationBarIndex : ${id}");
    this.bottomNavigationBarIndex = id;
  }

  void addSearchText(String searchText) {
    print("파람searchText : ${searchText}");
    this.searchText = searchText;
  }

  void addAuthorMoveId(int authorMoveId) {
    print("파람authorMoveId : ${authorMoveId}");
    this.authorMoveId = authorMoveId;
  }
}

// 3. 창고 관리자paramProvider
final paramProvider = Provider<ParamStore>((ref) {
  return new ParamStore();
});
