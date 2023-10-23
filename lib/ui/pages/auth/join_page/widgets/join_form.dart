import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/pages/auth/join_page/widgets/join_body.dart';

class JoinForm extends StatelessWidget {
  // ConsumerWidget로 해야함
  final _formKey = GlobalKey<FormState>();
  final _username = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();

  JoinForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // WidgetRef ref
    return JoinBody();
  }
}

