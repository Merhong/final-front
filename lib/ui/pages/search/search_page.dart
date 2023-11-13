import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/common_widgets/search_alert_dialog.dart';

class SearchPage extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SearchAlertDialog(),
      ),
    );
  }
}
