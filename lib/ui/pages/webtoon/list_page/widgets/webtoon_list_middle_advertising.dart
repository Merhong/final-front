import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/provider/advertising_sub_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../common_widgets/advertising.dart';

class WebtoonListMiddleAdvertising extends ConsumerWidget {
  const WebtoonListMiddleAdvertising({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.fromLTRB(sizePaddingLR17, sizeS5, sizePaddingLR17, sizeS5),
        child: Advertising(ADHeight: 55),
      ),
    );
  }
}
