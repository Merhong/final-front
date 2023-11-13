import 'package:flutter/material.dart';
import 'package:flutter_blog/data/provider/param_provider.dart';
import 'package:flutter_blog/data/provider/session_provider.dart';
import 'package:flutter_blog/ui/pages/auth/login_page/widgets/login_body.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AutoLoginPage extends ConsumerStatefulWidget {
  AutoLoginPage({Key? key}) : super(key: key);

  @override
  _AutoLoginPageState createState() => _AutoLoginPageState();
}

class _AutoLoginPageState extends ConsumerState<AutoLoginPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final refreshKey = GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    if (ref.read(paramProvider).isAutoLogin == false) {
      ref.read(paramProvider).isAutoLogin = true;
      ref.read(sessionProvider).autoLogin(ref);
    }

    return Scaffold(
      // appBar: AppBar(backgroundColor: Colors.blue[900]),
      // bottomNavigationBar: AppBottom(),
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
