import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyRecentDropdown extends ConsumerStatefulWidget {
  const MyRecentDropdown({super.key});

  @override
  _MyRecentDropdownState createState() => _MyRecentDropdownState();
}

class _MyRecentDropdownState extends ConsumerState<MyRecentDropdown> {
  final _sortList = ["등록 순", "새소식 순", "가나다 순"];
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
      // elevation: 1,
      dropdownColor: Colors.grey[300],
      // borderRadius: BorderRadius.all(Radius.circular(5)),

      icon: Icon(Icons.arrow_drop_down, color: Colors.green, size: 20),
      style: TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold),
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
          // ref.read(myRecentPageProvider.notifier).notifySort("${_selected}"); // TODO
        });
      },
    );
  }
}
