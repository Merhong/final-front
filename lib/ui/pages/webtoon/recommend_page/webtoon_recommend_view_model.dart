import 'package:flutter_blog/data/dto/recommend_dto/end_recommendation_DTO.dart';
import 'package:flutter_blog/data/dto/response_dto.dart';
import 'package:flutter_blog/data/model/Author.dart';
import 'package:flutter_blog/data/provider/session_provider.dart';
import 'package:flutter_blog/data/repository/recommend_repository.dart';
import 'package:flutter_blog/data/repository/webtoon_repository.dart';
import 'package:flutter_blog/main.dart';
import 'package:flutter_blog/ui/pages/webtoon/episode_page/webtoon_episode_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RecommendModel {
  List<EndRecommendationDTO> recommendationList;
  RecommendModel({required this.recommendationList});
}

class RecommendViewmodel extends StateNotifier<RecommendModel?> {
  Ref ref;
  RecommendViewmodel(this.ref, super._state);
  final mContext = navigatorKey.currentContext;

  Future<void> notifyInit() async {
    SessionUser sessionUser = ref.read(sessionProvider);
    ResponseDTO responseDTO = await recommendRepository().fetchRecommendList();
    print(responseDTO.data);
    state = RecommendModel(recommendationList: responseDTO.data);
  }
}

final recommendProvider =
    StateNotifierProvider<RecommendViewmodel, RecommendModel?>((ref) {
  return new RecommendViewmodel(ref, null)..notifyInit();
});
