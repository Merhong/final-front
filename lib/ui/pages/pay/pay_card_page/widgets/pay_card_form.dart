import 'package:flutter/material.dart';

class PayCardForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  PayCardForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(17.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: '카드번호',
                hintText: '',
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'CVC 번호 (카드 뒷면 숫자 3자리)',
                hintText: '',
              ),
            ),
            SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
