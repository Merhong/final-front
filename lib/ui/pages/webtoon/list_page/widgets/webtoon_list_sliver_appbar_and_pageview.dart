import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/pages/webtoon/list_page/webtoon_list_view_model.dart';
import 'package:flutter_blog/ui/pages/webtoon/list_page/widgets/webtoon_list_pageview.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../common_widgets/search_alert_dialog.dart';

class WebtoonListSliverAppBarAndPageView extends StatelessWidget {
  bool isScroll;

  WebtoonListSliverAppBarAndPageView(this.isScroll);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      centerTitle: true,
      // primary: false, // 상단 화면표시줄 침범함
      title: Container(width: 110, child: isScroll ? WebtoonListAppbarDropdown() : SizedBox()),
      backgroundColor: Colors.white,
      elevation: 0,
      leading: InkWell(
        onTap: () {},
        child: Icon(Icons.cookie, size: 30, color: Colors.orange),
      ),
      actions: [
        InkWell(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return SearchAlertDialog();
              },
            );
          },
          child: Icon(Icons.search, size: 30, color: Colors.black),
        ),
        SizedBox(width: 18),
      ],
      pinned: true,
      expandedHeight: 200,
      flexibleSpace: FlexibleSpaceBar(
        background: InkWell(
          onTap: () {
            print("페이지뷰클릭");
          },
          child: WebtoonListPageView(),
        ),
      ),
    );
  }
}

class WebtoonListAppbarDropdown extends ConsumerStatefulWidget {
  const WebtoonListAppbarDropdown({super.key});

  @override
  _WebtoonListAppbarDropdownState createState() => _WebtoonListAppbarDropdownState();
}

class _WebtoonListAppbarDropdownState extends ConsumerState<WebtoonListAppbarDropdown> {
  final _cities = ["인기 순", "별점 순", "등록 순", "가나다 순"];
  String _selectedCity = '';

  @override
  void initState() {
    super.initState();
    setState(() {
      _selectedCity = _cities[0];
    });
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      decoration: InputDecoration(border: UnderlineInputBorder(borderSide: BorderSide.none)),
      isDense: true,
      // dropdownColor: Colors.blue,
      // padding: EdgeInsets.all(0),
      // elevation: 0,
      // borderRadius: BorderRadius.all(Radius.zero),
      icon: Icon(Icons.arrow_drop_down, color: Colors.black, size: 30),
      style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
      value: _selectedCity,
      items: _cities.map(
        (e) {
          return DropdownMenuItem(
            value: e, // 선택 시 onChanged 를 통해 반환할 value
            child: Text(e),
          );
        },
      ).toList(),
      onChanged: (value) {
        // items 의 DropdownMenuItem 의 value 반환
        setState(() {
          _selectedCity = value!;
          print(_selectedCity);
          ref.read(webtoonListProvider.notifier).notifySort("${_selectedCity}");
        });
      },
    );
  }
}
