import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/pages/auth/logout_page/widgets/logout_body.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LogoutPage extends ConsumerWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final refreshKey = GlobalKey<RefreshIndicatorState>();

  LogoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      // appBar: AppBar(backgroundColor: Colors.blue[900]),
      // bottomNavigationBar: AppBottom(),
      body: LogoutBody(),
    );
  }
}
