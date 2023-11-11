import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/move.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/provider/param_provider.dart';

import 'package:flutter_blog/ui/common_widgets/app_bottom.dart';

import 'package:flutter_blog/ui/common_widgets/myapp_appbar.dart';
import 'package:flutter_blog/ui/pages/other/my_page/wigets/my_body_tab_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return WillPopScope(
      onWillPop: () {
        ParamStore ps = ref.read(paramProvider);
        onItemTapped(0, context, ps);
        // ps.addBottomNavigationBarIndex(0);
        return Future.value(false);
      },
      child: Container(
        color: Colors.white,
        child: SafeArea(
          child: Scaffold(
            // appBar: MyappAppbar(),
            body: MyBodyTabBar(),
            bottomNavigationBar: AppBottom(),
          ),
        ),
      ),
    );
  }
}
