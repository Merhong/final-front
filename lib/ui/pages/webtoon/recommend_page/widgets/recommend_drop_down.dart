import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RecommendDropdown extends ConsumerStatefulWidget {
  const RecommendDropdown({super.key});

  @override
  _RecommendDropdownState createState() => _RecommendDropdownState();
}

class _RecommendDropdownState extends ConsumerState<RecommendDropdown> {
  @override
  Widget build(BuildContext context) {
    return Text('추천완결', style: TextStyle(color: Colors.black));
  }
}
