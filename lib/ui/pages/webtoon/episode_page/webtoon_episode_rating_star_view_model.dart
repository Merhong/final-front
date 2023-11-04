import 'package:flutter_blog/data/dto/rating_star_request.dart';
import 'package:flutter_blog/data/dto/response_dto.dart';
import 'package:flutter_blog/data/dto/webtoon_dto/rating_star_DTO.dart';
import 'package:flutter_blog/data/provider/param_provider.dart';
import 'package:flutter_blog/data/provider/session_provider.dart';
import 'package:flutter_blog/data/repository/rating_star_repository.dart';
import 'package:flutter_blog/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

// 1. 창고 데이터

class WebtoonEpisodeRatingStarModel {
  RatingStarDTO? ratingStarDTO;
  int numberOfStar; // 선택된 별의 수
  WebtoonEpisodeRatingStarModel({this.numberOfStar = 0});
}

// 2. 창고
class WebtoonEpisodeRatingStarViewModel
    extends StateNotifier<WebtoonEpisodeRatingStarModel> {
  Ref ref;
  final mContext = navigatorKey.currentContext;

  // StateNotifier<PostListModel?> 에서 PostListModel은 상태의 타입
  WebtoonEpisodeRatingStarViewModel(this.ref, super._state); // 상태가 바뀌면 자동으로 그려짐

  Future<void> notifyNumberOfStars(int star) async {
    WebtoonEpisodeRatingStarModel model = state;
    model.numberOfStar = star;

    Logger().d("star 값 변경됨", model.numberOfStar);
    // 깊은 복사
    state = WebtoonEpisodeRatingStarModel(numberOfStar: model.numberOfStar);

    // notify 구독자들에게 알려줌
  }

  Future<ResponseDTO> notifyRatingStars() async {
    //요청, 반환까지  오래 걸리니까 퓨처박스 빈박스 반환, 빈박스가 차면 다시 돌아와서 진행
    RatingStarReqDTO ratingStarReqDTO =
        RatingStarReqDTO(score: state.numberOfStar);
    //ratingStarReqDTO 객체 생성 = 화면의 별점 값을 받아서 넣어줌
    Logger().d("여!!!!!!!!!!기", state.numberOfStar);

    RequestParam requestParam = ref.read(paramProvider);
    //모델을 반환
    SessionUser sessionUser = ref.read(sessionProvider);
    ResponseDTO responseDTO = await RatingStarRepository().fetchRatingStar(
        sessionUser.jwt!, ratingStarReqDTO, requestParam.episodeId!);

    return responseDTO;
  }
}

// 3. 창고 관리자 (View가 빌드되기 직전에 생성됨)
final webtoonEpisodeRatingStarProvider = StateNotifierProvider.autoDispose<
    WebtoonEpisodeRatingStarViewModel, WebtoonEpisodeRatingStarModel>((ref) {
  print("episode창고관리자 실행됨");
  return WebtoonEpisodeRatingStarViewModel(
      ref, WebtoonEpisodeRatingStarModel());
});

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
