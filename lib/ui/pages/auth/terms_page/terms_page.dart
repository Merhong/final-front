import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/common_widgets/custom_appbar.dart';
import 'package:flutter_blog/ui/pages/auth/terms_page/widgets/terms_body.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TermsPage extends ConsumerWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final refreshKey = GlobalKey<RefreshIndicatorState>();

  TermsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      // appBar: AppBar(backgroundColor: Colors.blue[900]),
      // bottomNavigationBar: AppBottom(),
      appBar: CustomAppBar(),
      body: TermsBody(),
    );
  }
}
