import 'package:flutter/material.dart';
import 'package:flutter_blog/data/dto/episode_dto/episode_DTO.dart';
import 'package:flutter_blog/data/provider/param_provider.dart';
import 'package:flutter_blog/ui/pages/other/my_page/my_interest_author_view_model.dart';
import 'package:flutter_blog/ui/pages/webtoon/episode_page/webtoon_episode_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WebtoonEpisodeDropdown extends ConsumerStatefulWidget {
  EpisodeDTO episodeDTO;

  WebtoonEpisodeDropdown({super.key, required this.episodeDTO});

  @override
  _WebtoonEpisodeDropdownState createState() => _WebtoonEpisodeDropdownState();
}

class _WebtoonEpisodeDropdownState extends ConsumerState<WebtoonEpisodeDropdown> {
  var _sortList = [];
  String _selected = '';

  @override
  void initState() {
    _sortList = [...widget.episodeDTO.episodeMoveDTOList.map((e) => e.detailTitle)];
    super.initState();
    setState(() {
      // print("테스트: ${_sortList}");
      int selectEpisodeIndex = widget.episodeDTO.episodeMoveDTOList.indexWhere((moveDTO) => moveDTO.id == widget.episodeDTO.episodeId);
      // _selected = _sortList[selectEpisodeIndex];

      _selected = widget.episodeDTO.episodeMoveDTOList.firstWhere((e) => e.id == ref.read(paramProvider).episodeId).detailTitle;

      print("_selected= ${_selected}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      decoration: InputDecoration(border: UnderlineInputBorder(borderSide: BorderSide.none)),
      isDense: true,
      isExpanded: true,
      // dropdownColor: Colors.blue,
      // elevation: 1,
      dropdownColor: Colors.grey[300],
      // borderRadius: BorderRadius.all(Radius.circular(5)),
      icon: Icon(Icons.menu, color: Colors.transparent, size: 1),
      // style: TextStyle(fontSize: 1),
      value: widget.episodeDTO.episodeMoveDTOList.firstWhere((e) => e.id == ref.read(paramProvider).episodeId).detailTitle,
      items: _sortList.map(
        (e) {
          return DropdownMenuItem(
            value: e, // 선택 시 onChanged 를 통해 반환할 value
            child: Text(e,
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 12, color: _selected == e ? Colors.black : Colors.grey, overflow: TextOverflow.ellipsis),
                maxLines: 1),
          );
        },
      ).toList(),
      onChanged: (value) {
        // items 의 DropdownMenuItem 의 value 반환
        setState(() {
          _selected = value!.toString();
          print("_selected = ${_selected}");

          int index = widget.episodeDTO.episodeMoveDTOList.indexWhere((moveDTO) => moveDTO.detailTitle == _selected);

          ParamStore ps = ref.read(paramProvider);
          ps.isEpisodeMove = true;
          ps.addEpisodeDetailId(widget.episodeDTO.episodeMoveDTOList[index].id); // 역순정렬?
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => WebtoonEpisodePage()));
        });
      },
    );
  }
}
