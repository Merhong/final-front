import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/pages/webtoon/list_page/widgets/webtoon_list_pageview.dart';

class WebtoonListSliverAppBarAndPageView extends StatelessWidget {
  const WebtoonListSliverAppBarAndPageView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      // title: InkWell(onTap: () {}, child: Text("인기순", style: TextStyle(fontSize: 30))),
      centerTitle: true,
      // primary: false, // 상단 화면표시줄 침범함
      // title: Text("title1", style: TextStyle(color: Colors.yellow)),
      title: Center(child: WebtoonListAppbarDropdown()),
      backgroundColor: Colors.white,
      elevation: 0,
      leading: Icon(Icons.cookie, size: 30, color: Colors.orange),
      actions: [
        Icon(Icons.search, size: 30, color: Colors.black),
        SizedBox(width: 10),
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

class WebtoonListAppbarDropdown extends StatefulWidget {
  const WebtoonListAppbarDropdown({super.key});

  @override
  State<WebtoonListAppbarDropdown> createState() => _WebtoonListAppbarDropdownState();
}

class _WebtoonListAppbarDropdownState extends State<WebtoonListAppbarDropdown> {
  final _cities = ["  인기 순", "  별점 순", "  업뎃 순", "가나다 순"];
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
    // return DropdownMenu(
    //   initialSelection: "1", // 처음 선택되어 있는거
    //   onSelected: (String? value) {
    //     setState(() {
    //       dropdownValue = value!;
    //     });
    //   },
    //   dropdownMenuEntries: [
    //     DropdownMenuEntry(value: "1", label: "a"),
    //     DropdownMenuEntry(value: "2", label: "b"),
    //     DropdownMenuEntry(value: "3", label: "c"),
    //   ],
    // );

    return DropdownButton(
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
        });
      },
    );
  }
}
