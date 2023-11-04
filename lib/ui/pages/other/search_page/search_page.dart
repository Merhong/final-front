import 'package:flutter/material.dart';
import 'package:flutter_blog/data/dto/webtoon_dto/search_webtoon_DTO.dart';
import 'package:flutter_blog/data/provider/param_provider.dart';
import 'package:flutter_blog/ui/common_widgets/app_bottom.dart';
import 'package:flutter_blog/ui/common_widgets/myapp_appbar.dart';
import 'package:flutter_blog/ui/pages/other/search_page/search_view_model.dart';
import 'package:flutter_blog/ui/pages/other/search_page/widgets/search_body.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchPage extends ConsumerWidget {
  SearchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (ref.read(paramProvider).isSearchMove == true) {
      ref.read(paramProvider).isSearchMove = false;
      ref.read(searchProvider.notifier).notifyInit();
    }

    SearchModel? model = ref.watch(searchProvider);

    if (model == null) {
      return Center(child: CircularProgressIndicator());
    }

    List<SearchWebtoonDTO> searchDTOList = model.searchDTOList;

    return Scaffold(
      body: SafeArea(child: SearchBody(searchDTOList)),
    );
  }
}
