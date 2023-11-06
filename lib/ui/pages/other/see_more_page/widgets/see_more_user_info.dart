import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/provider/param_provider.dart';
import 'package:flutter_blog/data/provider/session_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SeeMoreUserInfo extends ConsumerWidget {
  const SeeMoreUserInfo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SessionUser sessionUser = ref.read(sessionProvider);

    return InkWell(
      onTap: () {
        ref.read(paramProvider).addBottomNavigationBarIndex(0);
        ref.read(paramProvider).isAutoLogin = false;
        sessionUser.logout();
      },
      child: Container(
        height: 100,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: sizeM10),
              Text(
                "${sessionUser.user!.username}(${sessionUser.user!.email.split("@")[0]}) 님",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: sizeS5),
              Text("로그아웃 >", style: TextStyle(color: Colors.grey[600]))
            ],
          ),
        ),
      ),
    );
  }
}
