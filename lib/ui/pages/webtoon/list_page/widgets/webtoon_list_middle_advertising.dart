import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/size.dart';

import '../../../../common_widgets/advertising.dart';

class WebtoonListMiddleAdvertising extends StatelessWidget {
  const WebtoonListMiddleAdvertising({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.fromLTRB(sizePaddingLR17, sizeS5, sizePaddingLR17, sizeS5),
        child: Advertising(ADHeight: sizeXL50),
      ),
    );
  }
}
