import 'package:flutter_blog/data/dto/episode_dto/episode_DTO.dart';
import 'package:flutter_blog/data/dto/episode_dto/episode_like_dto.dart';
import 'package:flutter_blog/data/dto/response_dto.dart';
import 'package:flutter_blog/data/dto/webtoon_DTO/detail_page_webtoon_DTO.dart';
import 'package:flutter_blog/data/provider/param_provider.dart';
import 'package:flutter_blog/data/provider/session_provider.dart';
import 'package:flutter_blog/data/repository/episode_repository.dart';
import 'package:flutter_blog/main.dart';
import 'package:flutter_blog/ui/pages/webtoon/detail_page/webtoon_detail_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 1. 창고 데이터

class WebtoonEpisodeModel {
  EpisodeDTO episodeDTO;

  bool? isClick;
  WebtoonEpisodeModel({required this.episodeDTO, this.isClick = true});

  WebtoonEpisodeModel isClickUpdate() {
    EpisodeDTO updateEpisodeDTO = this.episodeDTO;
    bool updateIsClick = this.isClick!;
    print("클릭반영");
    return WebtoonEpisodeModel(
        episodeDTO: updateEpisodeDTO, isClick: !updateIsClick);
  }

  WebtoonEpisodeModel likeUpdate(bool isLike) {
    EpisodeDTO updateEpisodeDTO = this.episodeDTO;
    updateEpisodeDTO.like = isLike;
    isLike == true
        ? updateEpisodeDTO.likeEpisodeCount++
        : updateEpisodeDTO.likeEpisodeCount--;
    print("에피소드좋아요업뎃");
    return WebtoonEpisodeModel(episodeDTO: updateEpisodeDTO);
  }
}

// 2. 창고
class WebtoonEpisodeViewModel extends StateNotifier<WebtoonEpisodeModel?> {
  Ref ref;

  final mContext = navigatorKey.currentContext;

  // StateNotifier<PostListModel?> 에서 PostListModel은 상태의 타입
  WebtoonEpisodeViewModel(this.ref, super._state); // 상태가 바뀌면 자동으로 그려짐

  // notify 구독자들에게 알려줌
  Future<void> notifyInit() async {
    print("에피소드notifyInit실행");
    SessionUser sessionUser = ref.read(sessionProvider);
    int episodeId = ref.read(paramProvider).episodeId!;

    // Logger().d("1단계");
    ResponseDTO responseDTO =
        await EpisodeRepository().fetchEpisode(sessionUser.jwt!, episodeId);

    await EpisodeRepository()
        .fetchRecent(sessionUser.jwt!, episodeId); // 최근본웹툰 반영

    state = WebtoonEpisodeModel(episodeDTO: responseDTO.data);

    // TODO // 페이지 build 안에서 때리면 안되던데
    ref.read(webtoonDetailProvider.notifier).notifyEpisodeViewUpdate(episodeId);
  }

  Future<void> appBarHidden() async {
    state = state!.isClickUpdate();
  }

  Future<void> likeEpisode() async {
    SessionUser sessionUser = ref.read(sessionProvider);
    int episodeId = ref.read(paramProvider).episodeId!;
    bool like = state!.episodeDTO.like;

    ResponseDTO responseDTO =
        await EpisodeRepository().fetchLike(sessionUser.jwt!, episodeId, like);

    if (responseDTO.success == false) {
      return;
    }
    EpisodeLikeDTO episodeLikeDTO = responseDTO.data;
    print(episodeLikeDTO);
    state = state!.likeUpdate(episodeLikeDTO.isLike);
  }

  Future<DetailPageWebtoonDTO> notifyRandom() async {
    SessionUser sessionUser = ref.read(sessionProvider);
    ResponseDTO responseDTO =
        await EpisodeRepository().fetchRandom(sessionUser.jwt!);
    return responseDTO.data;
  }
}

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

// 3. 창고 관리자 (View가 빌드되기 직전에 생성됨)
final webtoonEpisodeProvider = StateNotifierProvider.autoDispose<
    WebtoonEpisodeViewModel, WebtoonEpisodeModel?>((ref) {
  print("episode창고관리자 실행됨");
  return new WebtoonEpisodeViewModel(ref, null)..notifyInit();
});
