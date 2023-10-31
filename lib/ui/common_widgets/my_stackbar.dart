import 'package:flutter/material.dart';

import '../../_core/constants/size.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> mySnackbar(BuildContext? context, int durationMS, Row snackbarRow) {
  return ScaffoldMessenger.of(context!).showSnackBar(
    SnackBar(
      content: snackbarRow,
      duration: Duration(milliseconds: durationMS),
      behavior: SnackBarBehavior.floating,
      width: sizeGetScreenWidth(context) * 0.8,
    ),
  );
}
