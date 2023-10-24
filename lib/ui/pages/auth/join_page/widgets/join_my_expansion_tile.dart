import 'package:flutter/material.dart';

class MyExpansionTile extends StatefulWidget {
  final String title;
  final List<Widget> content;

  MyExpansionTile({required this.title, required this.content});

  @override
  _MyExpansionTileState createState() => _MyExpansionTileState();
}

class _MyExpansionTileState extends State<MyExpansionTile> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          child: Container(
            color: Colors.white,
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '[필수] ',
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  widget.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(isExpanded ? Icons.expand_less : Icons.expand_more),
              ],
            ),
          ),
        ),
        if (isExpanded)
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
            ),
            child: Column(
              children: widget.content,
            ),
          ),
      ],
    );
  }
}
