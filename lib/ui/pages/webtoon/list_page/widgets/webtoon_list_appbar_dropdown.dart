import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/pages/webtoon/list_page/webtoon_list_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WebtoonListAppbarDropdown extends ConsumerStatefulWidget {
  const WebtoonListAppbarDropdown({super.key});

  @override
  _WebtoonListAppbarDropdownState createState() => _WebtoonListAppbarDropdownState();
}

class _WebtoonListAppbarDropdownState extends ConsumerState<WebtoonListAppbarDropdown> {
  final _sortList = ["인기 순", "별점 순", "최신 순", "가나다 순"];
  String _selected = '';

  @override
  void initState() {
    super.initState();
    setState(() {
      _selected = _sortList[0];
    });
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      decoration: InputDecoration(border: UnderlineInputBorder(borderSide: BorderSide.none)),
      isDense: true,
      // dropdownColor: Colors.blue,
      // padding: EdgeInsets.all(0),
      elevation: 1,
      dropdownColor: Colors.grey[300],
      // borderRadius: BorderRadius.all(Radius.zero),
      icon: Icon(Icons.arrow_drop_down, color: Colors.green, size: 30),
      style: TextStyle(fontSize: 19, color: Colors.black, fontWeight: FontWeight.bold),
      value: _selected,
      items: _sortList.map(
        (e) {
          return DropdownMenuItem(
            value: e, // 선택 시 onChanged 를 통해 반환할 value
            child: Text(e, style: TextStyle(color: _selected == e ? Colors.green : Colors.black)),
          );
        },
      ).toList(),
      onChanged: (value) {
        // items 의 DropdownMenuItem 의 value 반환
        setState(() {
          _selected = value!;
          print(_selected);
          ref.read(webtoonListProvider.notifier).notifySort("${_selected}");
        });
      },
    );
  }
}
